title: 大话PHP面向对象---模板方法模式
tags:
  - PHP
  - 大话
  - 模板方法
  - 设计模式
  - 面向对象
id: 329
categories:
  - php
date: 2013-05-11 21:39:20
---

>《大话设计模式》通篇都是以情景对话的形式，用多个小故事或编程示例来组织讲解GoF总结的23个设计模式。原文程序语言为C#，本系列文章将其同思想转换为PHP语言，让PHP的面向对象设计模式更加容易学习！

<!--more-->
**<span style="color: #ff0000;">AbstractClass.php</span>**
```php
&lt;?php
namespace Ms10;
/*
 *  
 *       ,==.              |~~~
 *      /  66\             |
 *      \c  -_)         |~~~
 *       `) (	        |
 *       /   \       |~~~
 *      /   \ \      |	encode UTF-8
 *     ((   /\ \_ |~~~	date 2013-3-6
 *      \\  \ `--` |	time 20:27:47
 *      / / /  |~~~	author lurrpis
 * ___ (_(___)_|	website http://www.ap1x.com
 * 
 */
abstract class AbstractClass{
    abstract function PrimitiveOperation1();
    abstract function PrimitiveOperation2();

    function TemplateMethod(){
        $this-&gt;PrimitiveOperation1();
        $this-&gt;PrimitiveOperation2();
    }
}
?&gt;
```

**<span style="color: #ff0000;">ConcreteClassA.php</span>**
```php
&lt;?php
namespace Ms10;
/*
 *  
 *       ,==.              |~~~
 *      /  66\             |
 *      \c  -_)         |~~~
 *       `) (	        |
 *       /   \       |~~~
 *      /   \ \      |	encode UTF-8
 *     ((   /\ \_ |~~~	date 2013-3-6
 *      \\  \ `--` |	time 20:30:51
 *      / / /  |~~~	author lurrpis
 * ___ (_(___)_|	website http://www.ap1x.com
 * 
 */
class ConcreteClassA extends AbstractClass{
    function PrimitiveOperation1() {
        echo &quot;具体类A方法1实现&lt;/br&gt;&quot;;
    }
    function PrimitiveOperation2() {
        echo &quot;具体类A方法2实现&lt;/br&gt;&quot;;
    }
}
?&gt;
```

**<span style="color: #ff0000;">ConcreteClassB.php</span>**
```php
&lt;?php
namespace Ms10;
/*
 *  
 *       ,==.              |~~~
 *      /  66\             |
 *      \c  -_)         |~~~
 *       `) (	        |
 *       /   \       |~~~
 *      /   \ \      |	encode UTF-8
 *     ((   /\ \_ |~~~	date 2013-3-6
 *      \\  \ `--` |	time 20:32:30
 *      / / /  |~~~	author lurrpis
 * ___ (_(___)_|	website http://www.ap1x.com
 * 
 */
class ConcreteClassB extends AbstractClass{
    function PrimitiveOperation1() {
        echo &quot;具体类B方法1实现&lt;/br&gt;&quot;;
    }
    function PrimitiveOperation2() {
        echo &quot;具体类B方法2实现&lt;/br&gt;&quot;;
    }
}
?&gt;
```

**<span style="color: #ff0000;">Ms10.php</span>**
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
 *     ((   /\ \_ |~~~	date 2013-3-6
 *      \\  \ `--` |	time 20:27:18
 *      / / /  |~~~	author lurrpis
 * ___ (_(___)_|	website http://www.ap1x.com
 * 
 */
chdir(dirname(__DIR__));

include &#039;App/Ms10/AbstractClass.php&#039;;
include &#039;App/Ms10/ConcreteClassA.php&#039;;
include &#039;App/Ms10/ConcreteClassB.php&#039;;

$c = new Ms10\ConcreteClassA;
$c-&gt;TemplateMethod();

$c = new Ms10\ConcreteClassB;
$c-&gt;TemplateMethod();

?&gt;
```
