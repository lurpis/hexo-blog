title: 大话PHP面向对象---单一职责模式
tags:
  - PHP
  - 单一职责
  - 大话
  - 设计模式
  - 面向对象
id: 81
categories:
  - php
date: 2013-05-06 20:08:04
---

>《大话设计模式》通篇都是以情景对话的形式，用多个小故事或编程示例来组织讲解GoF总结的23个设计模式。原文程序语言为C#，本系列文章将其同思想转换为PHP语言，让PHP的面向对象设计模式更加容易学习！

<!--more-->

**<span style="color: #ff0000;">ConcreteDecorator.php</span>**
```php
&lt;?php

/*
 *  
 *       ,==.              |~~~
 *      /  66\             |
 *      \c  -_)         |~~~
 *       `) (	        |
 *       /   \       |~~~
 *      /   \ \      |	encode UTF-8
 *     ((   /\ \_ |~~~	date 2013-3-1
 *      \\  \ `--` |	time 21:08:17
 *      / / /  |~~~	author lurrpis
 * ___ (_(___)_|	website http://www.ap1x.com
 * 
 */

include &quot;Decorator.php&quot;;
class TShirts extends Finery{
    function Show(){
        echo &quot;大T恤&quot;;
        //$base-&amp;gt;Show();
    }
}
class BigTrouser extends Finery{
    function Show(){
        echo &quot;垮裤&quot;;
       // $base-&amp;gt;show();
    }
}
class Qiuxie extends Finery{
    function Show(){
        echo &quot;球鞋&quot;;
       // $base-&amp;gt;show();
    }
}
class Jiake extends Finery{
    function Show(){
        echo &quot;夹克&quot;;
       // $base-&amp;gt;show();
    }
}
class Piku extends Finery{
    function Show(){
        echo &quot;皮裤&quot;;
       // $base-&amp;gt;Show();
    }
}
class Buxie extends Finery{
    function Show(){
        echo &quot;布鞋&quot;;
        //$base-&amp;gt;Show();
    }
}
class Pixie extends Finery{
    function Show(){
        echo &quot;皮鞋&quot;;
      //  $base-&amp;gt;Show();
    }
}
?&gt;
```

**<span style="color: #ff0000;">Decorator.php</span>**
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
 *     ((   /\ \_ |~~~	date 2013-3-1
 *      \\  \ `--` |	time 20:31:23
 *      / / /  |~~~	author lurrpis
 * ___ (_(___)_|	website http://www.ap1x.com
 * 
 */
include &quot;person.php&quot;;
//namespace Ms3;
class Finery extends Person
{
    public $component;
    //打扮
    //function Decorator($name){
     //   $name=$this-&gt;component;
    function Show(){
           $this-&gt;component;
    }
}

?&gt;
```

**<span style="color: #ff0000;">Person.php</span>**
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
 *     ((   /\ \_ |~~~	date 2013-3-1
 *      \\  \ `--` |	time 20:29:33
 *      / / /  |~~~	author lurrpis
 * ___ (_(___)_|	website http://www.ap1x.com
 * 
 */

class Person{
    public $person;
    function who($person){
        $this-&gt;person=$person;
    }
   function Show(){
        echo &quot;装扮的&quot;.$this-&gt;person;
   }
}

?&gt;
```

**<span style="color: #ff0000;">Ms3.php</span>**
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
 *     ((   /\ \_ |~~~	date 2013-3-1
 *      \\  \ `--` |	time 20:28:20
 *      / / /  |~~~	author lurrpis
 * ___ (_(___)_|	website http://www.ap1x.com
 * 
 */
include &quot;../App/Ms3/ConcreteDecorator.php&quot;;
include &quot;../App/Ms3/Decorator.php&quot;;
include &quot;../App/Ms3/Person.php&quot;;

$zj = new Person(&#039;zhangjia&#039;);
echo &quot;第一种装扮:&quot;;

$dtx = new TShirts();
$bt = new BigTrouser();
$qx = new Qiuxie();

$dtx-&gt;Decorator(&#039;zj&#039;);
$bt-&gt;Decorator($this-&gt;qx);
$qx-&gt;Decorator($this-&gt;dtx);
$dtx-&gt;Show();

?&gt;
```
