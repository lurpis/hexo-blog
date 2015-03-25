title: 私信/魔力日志发表方法、源代码
tags:
  - 教程
  - 源代码
id: 549
categories:
  - essay
date: 2013-05-22 13:31:32
---

>类似于这种东西我一直没有相信过也没有转过，直到我膝盖中了一枪。。(此句[原作者](http://ap1x.com/url.php?url=http://www.faceair.net/archives/81))

>于是就研究了一下其工作原理，其实是一个很简单的PHP绘图程序。现在把发表方法和源码公布给大家。可见短短几天的测试，访问量过万，转载和分享近千。

<!--more-->
![jc1](http://static.blog.lurrpis.com/wp-content/uploads/2013/05/jc1.png)

作用:类似于病毒式营销，利用QQ空间巨大流量对其进行转化，因为图片显示的内容，完全可以从后台进行操作。

转载后发现图片确实变了，并且有部分自己的信息，其实是通过访问者的URL获取其QQ号码去调用腾讯的API再从服务器绘图传回"个人中心"页面来完成的。

<span style="font-size: 13px; line-height: 19px;">不罗嗦了，这就来说方法吧。</span>

### 发表方法

选择:插入图片-&gt;网络图片-&gt;地址输入:http://fun.ap1x.com/qzone/fun.php-&gt;添加-&gt;确定-&gt;发表日志，然后到个人中心去查看。

有哪里不懂的在[留言板](http://ap1x.com/guest)留言,我会第一时间回复你

![jc2](http://ap1x.com/wp-content/uploads/2013/05/jc2.png)

# 源代码

**<span style="color: #ff0000;">fun.php</span>**
<pre class="brush: php; gutter: true; first-line: 1; highlight: []; html-script: false">&lt;?php
$referer=$_SERVER[&#039;HTTP_REFERER&#039;];
//$referer=&#039;http://user.qzone.qq.com/28568090/infocenter&#039;;
$ip=GetIP();
if(!strpos($referer,&#039;infocenter&#039;)){//如果不是从个人中心进来
	header(&#039;Location: private.png&#039;);
	exit();
}

//截取QQ
$urlArr = explode(&#039;/&#039;,$referer);
$qq = $urlArr[&#039;3&#039;];

//用户姓名
$qname=file(&#039;name.txt&#039;);
$qqq=file(&#039;qq.txt&#039;);
foreach($qqq as $key=&gt;&amp;$line){
       $newqq[$key]=trim($line);
	   }
foreach($qname as $key=&gt;&amp;$line){
       $newqname[$key]=trim($line);
	   }
$arr = array_combine($newqq,$newqname);
$username = getQQName($qq,$arr);

//信息位置
include &#039;ip/IpLocation.class.php&#039;;
$ipClass = new IpLocation(&#039;UTFWry.dat&#039;);
$area = $ipClass-&gt;getlocation($ip);
$place = str_replace(&#039;CZ88.NET&#039;,&#039;&#039;,$area[&#039;country&#039;]);

//在线状态
$QQState = get_qq_status($qq);

//创建图像
header(&quot;Content-type: image/gif&quot;);
$im = imagecreatetruecolor(400, 200);
$color=imagecolorallocate($im,255,255,255);

//设置透明
imagefill($im,0,0,$color);

//设置颜色
$black = ImageColorAllocate($im,0,0,0);
$pink  = ImageColorAllocate($im, 0 , 0 ,255);
$pinktrue = ImageColorAllocate($im,255,0,156);
$red   = ImageColorAllocate($im, 255 , 0 ,0);
$zise  = ImageColorAllocate($im, 0 , 255 ,0);
$fontfile = &quot;fonts/pop.ttf&quot;;//POP字库

//打印qzone头像
$qqlogo = imagecreatefromjpeg(&#039;http://qlogo3.store.qq.com/qzone/&#039;.$qq.&#039;/&#039;.$qq.&#039;/50&#039;);
imagecopy( $im, $qqlogo, 20, 23, 0, 0, 50, 50 );
ImageDestroy($qqlogo);

//打印用户名
$con = array();
include &#039;content.php&#039;;
ImageTTFText($im, 13,0,80,40,$pink,$fontfile,&#039;呼叫&#039;.$username);

//打印ip信息
ImageTTFText($im, 12,0,80,70,$pink,$fontfile,&#039;小样还&#039;.$stateStr.&#039;?&#039;);

//打印文章内容
$rand = rand(0,count($con)-1);
ImageTTFText($im, 11,0,20,105,$black,$fontfile,$con[$rand]);
ImageTTFText($im, 10,0,200,195,$red,$fontfile,&#039;谁看显谁,方法源码尽在 ap1x.com&#039;);
Imagegif($im);
ImageDestroy($im);
exit();

//获取ip
function GetIP(){
	if (getenv(&quot;HTTP_CLIENT_IP&quot;) &amp;&amp; strcasecmp(getenv(&quot;HTTP_CLIENT_IP&quot;), &quot;unknown&quot;)){
		$ip = getenv(&quot;HTTP_CLIENT_IP&quot;);
	}else if (getenv(&quot;HTTP_X_FORWARDED_FOR&quot;) &amp;&amp; strcasecmp(getenv(&quot;HTTP_X_FORWARDED_FOR&quot;), &quot;unknown&quot;)){
		$ip = getenv(&quot;HTTP_X_FORWARDED_FOR&quot;);
	}else if (getenv(&quot;REMOTE_ADDR&quot;) &amp;&amp; strcasecmp(getenv(&quot;REMOTE_ADDR&quot;), &quot;unknown&quot;)){
		$ip = getenv(&quot;REMOTE_ADDR&quot;);
	}else if (isset($_SERVER[&#039;REMOTE_ADDR&#039;]) &amp;&amp; $_SERVER[&#039;REMOTE_ADDR&#039;] &amp;&amp; strcasecmp($_SERVER[&#039;REMOTE_ADDR&#039;], &quot;unknown&quot;)){
		$ip = $_SERVER[&#039;REMOTE_ADDR&#039;];
	}else{
		$ip = &quot;unknown&quot;;
	}	
	//bae 的ip要特殊处理
	if (strpos($ip,&#039;,&#039;)) {
		$ipArr = explode(&#039;,&#039;,$ip);
		$ip = $ipArr[0];
	}
	return($ip);
}

//获取QQ状态
function get_qq_status($qq) {
    $data = file_get_contents(&quot;http://webpresence.qq.com/getonline?type=1&amp;{$qq}:&quot;);
    $data || $data = strlen(file_get_contents(&quot;http://wpa.qq.com/pa?p=2:{$qq}:45&quot;));
    if(!$data) { return 0; }
    switch((string)$data) {
      case &#039;854&#039;: case &#039;online[0]=0;&#039;: return FALSE;
      case &#039;834&#039;: case &#039;online[0]=1;&#039;: return TRUE;
    }

  return 3;
}

//获取QQ昵称
function getQQNick($qq){
	$str = file_get_contents(&#039;http://r.qzone.qq.com/cgi-bin/user/cgi_personal_card?uin=&#039;.$qq);
	$pattern = &#039;/&#039;.preg_quote(&#039;&quot;nickname&quot;:&quot;&#039;,&#039;/&#039;).&#039;(.*?)&#039;.preg_quote(&#039;&quot;,&#039;,&#039;/&#039;).&#039;/i&#039;;
	preg_match ( $pattern,$str, $result );
	return $result[1];
}

//获取QQ姓名(若未设置则取昵称)
function getQQName($qq,$arr){
		$username=&#039;kong&#039;;
	foreach ($arr as $key=&gt;$value){
		if($key == $qq){
			$username=$arr[$key];
		}
	}
	if ($username==&#039;kong&#039;) {
		$username = getQQNick($qq);
		}
		return $username;
		}
?&gt;</pre>
[fland_alert style="grey"]源码说明:
name.txt 为设置姓名
qq.txt 为设置QQ
其关系行行对应
比如:
张三、李四、王二麻子的QQ依次是123456、3212312、6786456
这样张三将在私信中看到自己的真实姓名,当然你也可以自由发挥咯(嘿嘿，你懂的)

设置好上传到你的服务器即可

剩下的源码就打包咯

本站处于建站初期，招作者编辑，可设置单独页面，详情[点我](http://ap1x.com/apply)

[fland_button url="http://www.kuaipan.cn/file/id_147150986924785665.htm" style="light-blue" size="small" type="square" target="_blank"] 下载地址 [/fland_button] 