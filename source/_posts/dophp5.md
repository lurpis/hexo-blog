title: 大话PHP面向对象---工厂方法模式
tags:
  - PHP
  - 大话
  - 工厂方法
  - 设计模式
  - 面向对象
id: 320
categories:
  - php
date: 2013-05-11 21:27:29
---

>《大话设计模式》通篇都是以情景对话的形式，用多个小故事或编程示例来组织讲解GoF总结的23个设计模式。原文程序语言为C#，本系列文章将其同思想转换为PHP语言，让PHP的面向对象设计模式更加容易学习！

<!--more-->
**<span style="color: #ff0000;">IFactory.php</span>**
```php
&lt;?php
namespace Ms8;
interface IFactory {

    function CreateLeiFeng();
}
?&gt;
```

**<span style="color: #ff0000;">LeiFeng.php</span>**
```php
&lt;?php

namespace Ms8;

/*
 *  
 *       ,==.              |~~~
 *      /  66\             |
 *      \c  -_)         |~~~
 *       `) (	        |
 *       /   \       |~~~
 *      /   \ \      |	encode UTF-8
 *     ((   /\ \_ |~~~	date 2013-3-3
 *      \\  \ `--` |	time 17:58:02
 *      / / /  |~~~	author lurrpis
 * ___ (_(___)_|	website http://www.ap1x.com
 * 
 */

class LeiFeng {

    public $who;
    public $shenfen;

    function Sweep() {
        echo $this-&gt;shenfen . $this-&gt;who . &quot;扫地&lt;/br&gt;&quot;;
    }

    function Wash() {
        echo $this-&gt;shenfen . $this-&gt;who . &quot;洗衣&lt;/br&gt;&quot;;
    }

    function BuyRice() {
        echo $this-&gt;shenfen . $this-&gt;who . &quot;买米&lt;/br&gt;&quot;;
    }

}

?&gt;
```

**<span style="color: #ff0000;">Undergraduate.php</span>**
```php
&lt;?php

namespace Ms8;

/*
 *  
 *       ,==.              |~~~
 *      /  66\             |
 *      \c  -_)         |~~~
 *       `) (	        |
 *       /   \       |~~~
 *      /   \ \      |	encode UTF-8
 *     ((   /\ \_ |~~~	date 2013-3-3
 *      \\  \ `--` |	time 18:15:31
 *      / / /  |~~~	author lurrpis
 * ___ (_(___)_|	website http://www.ap1x.com
 * 
 */

class Undergraduate extends LeiFeng {

    function __construct($shenfen) {
        $this-&gt;shenfen = $shenfen;
    }

}

?&gt;
```

**<span style="color: #ff0000;">UndergraduateFactory.php</span>**
```php
&lt;?php

namespace Ms8;

/*
 *  
 *       ,==.              |~~~
 *      /  66\             |
 *      \c  -_)         |~~~
 *       `) (	        |
 *       /   \       |~~~
 *      /   \ \      |	encode UTF-8
 *     ((   /\ \_ |~~~	date 2013-3-3
 *      \\  \ `--` |	time 18:01:21
 *      / / /  |~~~	author lurrpis
 * ___ (_(___)_|	website http://www.ap1x.com
 * 
 */

class UndergraduatFactory implements IFactory {

    public $shenfen;

    function __construct($shenfen) {
        $this-&gt;shenfen = $shenfen;
    }

    function CreateLeiFeng() {
        return new \Ms8\Undergraduate($this-&gt;shenfen);
    }

}

?&gt;
```

**<span style="color: #ff0000;">Volunteer.php</span>**
```php
&lt;?php

namespace Ms8;

/*
 *  
 *       ,==.              |~~~
 *      /  66\             |
 *      \c  -_)         |~~~
 *       `) (	        |
 *       /   \       |~~~
 *      /   \ \      |	encode UTF-8
 *     ((   /\ \_ |~~~	date 2013-3-3
 *      \\  \ `--` |	time 18:16:45
 *      / / /  |~~~	author lurrpis
 * ___ (_(___)_|	website http://www.ap1x.com
 * 
 */

class Volunteer extends LeiFeng {

    function __construct() {
        $this-&gt;shenfen = &#039;志愿者&#039;;
    }

}

?&gt;
```

**<span style="color: #ff0000;">VolunteerFactory.php</span>**
```php
&lt;?php

namespace Ms8;

/*
 *  
 *       ,==.              |~~~
 *      /  66\             |
 *      \c  -_)         |~~~
 *       `) (	        |
 *       /   \       |~~~
 *      /   \ \      |	encode UTF-8
 *     ((   /\ \_ |~~~	date 2013-3-3
 *      \\  \ `--` |	time 18:02:46
 *      / / /  |~~~	author lurrpis
 * ___ (_(___)_|	website http://www.ap1x.com
 * 
 */

class VolunteerFactory implements IFactory {

    function CreateLeiFeng() {
        return new \Ms8\Volunteer();
    }

}

?&gt;
```

**<span style="color: #ff0000;">Ms8.php</span>**
```php
&lt;?php

/*
 *  
 *       ,==.              |~~~
 *      /  66\             |
 *      \c  -_)         |~~~
 *       `) (	        |
 *       /   \       |~~~
 *      /   \ \      |	encode UTF-8
 *     ((   /\ \_ |~~~	date 2013-3-3
 *      \\  \ `--` |	time 18:03:40
 *      / / /  |~~~	author lurrpis
 * ___ (_(___)_|	website http://www.ap1x.com
 * 
 */
chdir(dirname(__DIR__));

include &#039;App/Ms8/IFactory.php&#039;;
include &#039;App/Ms8/LeiFeng.php&#039;;
include &#039;App/Ms8/UndergraduateFactory.php&#039;;
include &#039;App/Ms8/VolunteerFactory.php&#039;;
include &#039;App/Ms8/Undergraduate.php&#039;;
include &#039;App/Ms8/Volunteer.php&#039;;

$undergraduatfactory = new \Ms8\UndergraduatFactory(&#039;大学生&#039;);
$zhangjia = $undergraduatfactory-&gt;CreateLeiFeng();
$zhangjia-&gt;who = &#039;张嘉&#039;;
$zhangjia-&gt;BuyRice();
$volunteerfactory = new \Ms8\VolunteerFactory();
$hanning = $volunteerfactory-&gt;CreateLeiFeng();
$hanning-&gt;who = &#039;韩宁&#039;;
$hanning-&gt;Sweep();
$zhangjia-&gt;Wash();
?&gt;
```
