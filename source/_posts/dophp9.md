title: 大话PHP面向对象---策略模式
tags:
  - PHP
  - 大话
  - 策略模式
  - 设计模式
  - 面向对象
id: 75
categories:
  - php
date: 2013-05-05 21:54:39
---

>《大话设计模式》通篇都是以情景对话的形式，用多个小故事或编程示例来组织讲解GoF总结的23个设计模式。原文程序语言为C#，本系列文章将其同思想转换为PHP语言，让PHP的面向对象设计模式更加容易学习！

<!--more-->
**<span style="color: #ff0000;">Context.php</span>**
```php
&amp;lt;?php
namespace Ms2;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Context
 *
 * @author suixu
 */
class Context {

//put your code here
        protected $strategy;
        public function __construct($type) {
                $this-&amp;gt;getStrategy($type);
        }

      public function set($type) {
                $this-&amp;gt;getStrategy($type);
        }

        //上下文接口
        public function GetMoney($money) {
                return $this-&amp;gt;strategy-&amp;gt;GetCont($money);
        }
        public function getStrategy($type) {
                switch ($type) {
                        case &amp;quot;正常收费&amp;quot; :
                                $this-&amp;gt;strategy = new \Ms2\StrategyA();
                                break;
                        case &amp;quot;双倍收费&amp;quot; :
                                $this-&amp;gt;strategy = new \Ms2\StrategyB();
                                break;
                }
        }
}
?&amp;gt;
```

<!--more-->
**<span style="color: #ff0000;">Strategy.php</span>**
```php
&lt;?php

namespace Ms2;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of OperationAdd
 *
 * @author suixu
 */
abstract class Strategy {

        //put your code here
        abstract public function GetCont($money);
}

?&gt;
```

**<span style="color: #ff0000;">StrategyA.php</span>**
```php
&lt;?php
namespace Ms2;
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Stategy
 *
 * @author suixu
 */
class StrategyA extends Strategy {
        //put your code here
        public function GetCont($money){
                return $money;
        }
}

?&gt;
```

**<span style="color: #ff0000;">StrategyB.php</span>**
```php
&lt;?php
namespace Ms2;
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Stategy
 *
 * @author suixu
 */
class StrategyB extends Strategy {
        //put your code here
        public function GetCont($money){
                return $money*2;
        }
}

?&gt;
```

**<span style="color: #ff0000;">Ms2.php</span>**
```php
&lt;?php
chdir(dirname(__DIR__));
include &#039;App/Ms2/Context.php&#039;;
include &#039;App/Ms2/Strategy.php&#039;;
include &#039;App/Ms2/StrategyA.php&#039;;
include &#039;App/Ms2/StrategyB.php&#039;;

$Context = new \Ms2\Context(&#039;正常收费&#039;);
$totalPrices = $Context -&gt;GetMoney(&quot;100&quot;);
$Context -&gt;set(&#039;双倍收费&#039;);
$totalPrices += $Context -&gt;GetMoney(&quot;400&quot;);
echo $totalPrices;
?&gt;
```
