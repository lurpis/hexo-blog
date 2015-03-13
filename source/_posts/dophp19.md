title: "ajaxFileUpload上传捕获不到服务器返回json,被加pre标签"
tags:
  - ajax success不执行
  - ajaxFileUpload
id: 1306
categories:
  - php
date: 2015-02-27 02:21:14
---
在做项目 的时候用ajaxFileUpload上传文件的时候服务器返回了json或是捕获不到数据,用百度google搜索了下,没有找什么答案,这就奇怪了,明明服务器返回了json数据,但为什么会捕获不到呢?
我把ajaxFileUpload源码拿过来了研究了一下,结果在这里发现了一点问题,代码如下:
```javascript
uploadHttpData: function( r, type ) {
    var data = !type;
    data = type == &quot;xml&quot; || data ? r.responseXML : r.responseText;
    // If the type is &quot;script&quot;, eval it in global context
    if ( type == &quot;script&quot; )
        jQuery.globalEval( data );
    // Get the JavaScript object, if JSON is used.
    if ( type == &quot;json&quot; ) {
          eval( &quot;data = &quot; + data);
    }
    // evaluate scripts within html
    if ( type == &quot;html&quot; )
        jQuery(&quot;&lt;div&gt;&quot;).html(data).evalScripts();
    return data;
}
```
看上面的代码`if(type=="json")`这里,然后下面就是执行了`eval`;
我在这里断了个点
然后看到调试里显示`r.responseText`值是这样的
`<pre>{...这里是服务器返回的json数据}</pre>`
我到是奇怪了,服务器明明返回的是json数据,但是捕获到的确是json数据被
`<pre>`包含
结果看服务器输出的头是这样的
`header("Content-type:application/json; charset=utf-8");`
这个说明是想告诉浏览器返回的数据格式是json格式,RFC4627标准中就规定了JSON数据的媒体类型是`application/json`,应该是没有错的,可能是估计目前有浏览器这个类型支持的不是太好,把获取到的数据会加上`</pre>`
`<pre>`搞定的方法
一,是改这个header部分为`header("Content-type:text/html;charset=utf-8");`改为text类型就没有问题了
二.改写ajaxFileUpload上面代码里的内容, 具体内容我就直接上代码了,意思就是将`<pre>`过滤掉
```javascript
uploadHttpData: function( r, type ) {
    var data = !type;
    data = type == &quot;xml&quot; || data ? r.responseXML : r.responseText;
    // If the type is &quot;script&quot;, eval it in global context
    if ( type == &quot;script&quot; )
        jQuery.globalEval( data );
    // Get the JavaScript object, if JSON is used.
    if ( type == &quot;json&quot; ) {
         ////////////以下为新增代码///////////////
         data = r.responseText;
         var start = data.indexOf(&quot;&gt;&quot;);
         if(start != -1) {
           var end = data.indexOf(&quot;&lt;&quot;, start + 1);
           if(end != -1) {
             data = data.substring(start + 1, end);
            }
         }
          ///////////以上为新增代码///////////////
          eval( &quot;data = &quot; + data);
    }
    // evaluate scripts within html
    if ( type == &quot;html&quot; )
        jQuery(&quot;&lt;div&gt;&quot;).html(data).evalScripts();
    return data;
}
```
>以上摘自[http://upvup.com/html/JQuery/2014-11-15/8.html](http://upvup.com/html/JQuery/2014-11-15/8.html)

经历了这些，依然没有解决我的问题，`console.log(data)`后，依然显示
`<pre> style='word-wrap: break-word; white-space: pr…na\/wu\/doc_img\/20150227\/1424973817.png'}</pre>`
本来下午就在公司加班到天黑还没有解决的问题，现在回家折腾了两个小时还存在，很是恼火，顺便吐槽下长城宽带，慢的跟头猪一样，想上刷会微博休息下，网也上不去，FAST无线路由器也是便宜没好货，间歇性掉线，气愤之余又打开3G流量立马拍了个tplink，统统都换了！

然后又继续折腾。

本已疲惫不堪，又压住烦躁的心情再去仔细看一遍ajaxfileupload.js的源码(这酸爽,简直duang~duang~duang)，就在这时代码加上了特技，发现complete回调函数没有data参数，原来，之前因为pre标签，始终不执行`success:function(data)`，为了绕过，使用了`complete:function(data)`，导致无论怎样修改源码，依然带pre标签，按照上文的介绍，使用`success:function(data)`成功返回正常的`json`。