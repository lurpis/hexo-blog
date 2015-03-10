title: 大话PHP面向对象---外观模式
tags:
  - PHP
  - 外观模式
  - 大话
  - 设计模式
  - 面向对象
id: 331
categories:
  - php
date: 2013-05-11 21:45:07
---

>《大话设计模式》通篇都是以情景对话的形式，用多个小故事或编程示例来组织讲解GoF总结的23个设计模式。原文程序语言为C#，本系列文章将其同思想转换为PHP语言，让PHP的面向对象设计模式更加容易学习！

<!--more-->

**<span style="color: #ff0000;">Facade.php</span>**
```php
&lt;?php
namespace Ms12;
/*
 *  
 *       ,==.              |~~~
 *      /  66\             |
 *      \c  -_)         |~~~
 *       `) (	        |
 *       /   \       |~~~
 *      /   \ \      |	encode UTF-8
 *     ((   /\ \_ |~~~	date 2013-3-7
 *      \\  \ `--` |	time 15:55:15
 *      / / /  |~~~	author lurrpis
 * ___ (_(___)_|	website http://www.ap1x.com
 * 
 */
class Facade {
    public $one;
    public $two;
    public $three;
    public $four;
    public function Facade() {
        $this-&gt;one = new \Ms12\SubSystemOne();
        $this-&gt;two = new \Ms12\SubSystemTwo();
        $this-&gt;three = new \Ms12\SubSystemThree();
        $this-&gt;four = new \Ms12\SubSystemFour();
    }
    public function MethodA() {
        echo &quot; &lt;/br&gt;方法组A() &lt;/br&gt;&quot;;
        $this-&gt;one-&gt;MethodOne();
        $this-&gt;two-&gt;MethodTwo();
        $this-&gt;four-&gt;MethodFour();
    }
    public function MethodB() {
        echo &quot; &lt;/br&gt;方法组B() &lt;/br&gt;&quot;;
        $this-&gt;two-&gt;MethodTwo();
        $this-&gt;three-&gt;MethodThree();
    }
}
?&gt;
```

**<span style="color: #ff0000;">SubSystemFour.php</span>**
```php
&lt;?php
namespace Ms12;
/*
 *  
 *       ,==.              |~~~
 *      /  66\             |
 *      \c  -_)         |~~~
 *       `) (	        |
 *       /   \       |~~~
 *      /   \ \      |	encode UTF-8
 *     ((   /\ \_ |~~~	date 2013-3-7
 *      \\  \ `--` |	time 15:54:02
 *      / / /  |~~~	author lurrpis
 * ___ (_(___)_|	website http://www.ap1x.com
 * 
 */
class SubSystemFour {
    public function MethodFour() {
        echo &quot;子系统方法四&lt;/br&gt;&quot;;
    }

}
?&gt;
```

**<span style="color: #ff0000;">SubSystemOne.php</span>**
```php
&lt;?php
namespace Ms12;
/*
 *  
 *       ,==.              |~~~
 *      /  66\             |
 *      \c  -_)         |~~~
 *       `) (	        |
 *       /   \       |~~~
 *      /   \ \      |	encode UTF-8
 *     ((   /\ \_ |~~~	date 2013-3-7
 *      \\  \ `--` |	time 15:50:26
 *      / / /  |~~~	author lurrpis
 * ___ (_(___)_|	website http://www.ap1x.com
 * 
 */
class SubSystemOne {
    public function MethodOne() {
        echo &quot;子系统方法一&lt;/br&gt;&quot;;
    }
}
?&gt;
```

**<span style="color: #ff0000;">SubSystemThree.php</span>**
```php
&lt;?php

namespace Ms12;

/*
 *  
 *       ,==.              |~~~
 *      /  66\             |
 *      \c  -_)         |~~~
 *       `) (	        |
 *       /   \       |~~~
 *      /   \ \      |	encode UTF-8
 *     ((   /\ \_ |~~~	date 2013-3-7
 *      \\  \ `--` |	time 15:52:38
 *      / / /  |~~~	author lurrpis
 * ___ (_(___)_|	website http://www.ap1x.com
 * 
 */

class SubSystemThree {

    public function MethodThree() {
        echo &quot;子系统方法三&lt;/br&gt;&quot;;
    }

}

?&gt;
```

**<span style="color: #ff0000;">SubSystemTwo.php</span>**
```php
&lt;?php

namespace Ms12;

/*
 *  
 *       ,==.              |~~~
 *      /  66\             |
 *      \c  -_)         |~~~
 *       `) (	        |
 *       /   \       |~~~
 *      /   \ \      |	encode UTF-8
 *     ((   /\ \_ |~~~	date 2013-3-7
 *      \\  \ `--` |	time 15:51:42
 *      / / /  |~~~	author lurrpis
 * ___ (_(___)_|	website http://www.ap1x.com
 * 
 */

class SubSystemTwo {

    public function MethodTwo() {
        echo &quot;子系统方法二&lt;/br&gt;&quot;;
    }

}

?&gt;
```

**<span style="color: #ff0000;">Ms12.php</span>**
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
 *     ((   /\ \_ |~~~	date 2013-3-7
 *      \\  \ `--` |	time 16:00:54
 *      / / /  |~~~	author lurrpis
 * ___ (_(___)_|	website http://www.ap1x.com
 * 
 */
chdir(dirname(__DIR__));

include &#039;App/Ms12/Facade.php&#039;;
include &#039;App/Ms12/SubSystemOne.php&#039;;
include &#039;App/Ms12/SubsystemTwo.php&#039;;
include &#039;App/Ms12/SubsystemThree.php&#039;;
include &#039;App/Ms12/SubsystemFour.php&#039;;

$facade = new \Ms12\Facade;

$facade-&gt;Facade();
$facade-&gt;MethodA();
$facade-&gt;MethodB();
?&gt;
```
