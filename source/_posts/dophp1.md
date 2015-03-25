title: 大话PHP面向对象---代理模式
tags:
  - PHP
  - 代理模式
  - 大话
id: 317
categories:
  - php
date: 2013-05-11 21:21:11
---

>《大话设计模式》通篇都是以情景对话的形式，用多个小故事或编程示例来组织讲解GoF总结的23个设计模式。原文程序语言为C#，本系列文章将其同思想转换为PHP语言，让PHP的面向对象设计模式更加容易学习！[/fland_alert]

<!--more-->
**<span style="color: #ff0000;">Proxy.php</span>**
```php
<?php
namespace Ms6;
/*
 *  
 *       ,==.              |~~~
 *      /  66\             |
 *      \c  -_)         |~~~
 *       `) (	        |
 *       /   \       |~~~
 *      /   \ \      |	encode UTF-8
 *     ((   /\ \_ |~~~	date 2013-3-2
 *      \\  \ `--` |	time 20:29:17
 *      / / /  |~~~	author lurrpis
 * ___ (_(___)_|	website http://www.ap1x.com
 * 
 */

class Proxy extends Ssd{

    public $realSubject;

    function Request() {
       // if ($this-&gt;realSubject == null) {
            $this-&gt;realSubject = new \Ms6\RealSubject();
      //  }
        $this-&gt;realSubject-&gt;Request();
    }
}

?>
```

**<span style="color: #ff0000;">RealSubject.php</span>**
```php
<?php
namespace Ms6;

/*
 *  
 *       ,==.              |~~~
 *      /  66\             |
 *      \c  -_)         |~~~
 *       `) (	        |
 *       /   \       |~~~
 *      /   \ \      |	encode UTF-8
 *     ((   /\ \_ |~~~	date 2013-3-2
 *      \\  \ `--` |	time 20:31:52
 *      / / /  |~~~	author lurrpis
 * ___ (_(___)_|	website http://www.ap1x.com
 * 
*/

class RealSubject extends Ssd{
    function Request() {
        echo &quot;真实的请求&quot;;
    }
}
?>

**<span style="color: #ff0000;">Ssd.php</span>**
```php
<?php
namespace Ms6;
/*
 *  
 *       ,==.              |~~~
 *      /  66\             |
 *      \c  -_)         |~~~
 *       `) (	        |
 *       /   \       |~~~
 *      /   \ \      |	encode UTF-8
 *     ((   /\ \_ |~~~	date 2013-4-3
 *      \\  \ `--` |	time 21:49:41
 *      / / /  |~~~	author lurrpis
 * ___ (_(___)_|	website http://www.ap1x.com
 * 
 */

abstract class Ssd{
    public abstract function Request();
}
?>
```

**<span style="color: #ff0000;">Ms6.php</span>**
```php
<?php
include &#039;App/Ms6/Proxy.php&#039;;
include &#039;App/Ms6/RealSubject.php&#039;;
include &#039;App/Ms6/wws.php&#039;;

$proxy11=new \Ms6\Proxy();
$proxy11-&gt;Request();

?>
```