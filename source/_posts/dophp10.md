title: 大话PHP面向对象---装饰模式
tags:
  - PHP
  - 大话
  - 装饰模式
id: 311
categories:
  - php
date: 2013-05-11 21:06:51
---

>《大话设计模式》通篇都是以情景对话的形式，用多个小故事或编程示例来组织讲解GoF总结的23个设计模式。原文程序语言为C#，本系列文章将其同思想转换为PHP语言，让PHP的面向对象设计模式更加容易学习！

<!--more-->
**<span style="color: #ff0000;">FruitA.php</span>**
```php
&lt;?php
namespace Ms6;
/**
 * Description of FruitA
 *
 * @author suixu
 */
class FruitA extends FruitBase {
        //put your code here
        public function eat() {
                parent::eat();
                echo&quot;A:吃苹果&lt;br&gt;&quot;;
        }
}
```

**<span style="color: #ff0000;">FruitB.php</span>**
```php
&lt;?php
namespace Ms6;
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

class FruitB extends FruitBase {

        //put your code here
        public function eat() {
                parent::eat();
                echo&quot;B:吃草莓&lt;br&gt;&quot;;
        }

}

?&gt;
```

**<span style="color: #ff0000;">FruitInface.php</span>**
```php
&lt;?php
namespace Ms6;
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Person
 *
 * @author suixu
 */
abstract class FruitInface {
        abstract public function eat();
}
```

**<span style="color: #ff0000;">FruitC.php</span>**
```php
&lt;?php
namespace Ms6;
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

class FruitC extends FruitBase {

        //put your code here
        public function eat() {
                parent::eat();
                echo&quot;C:吃香蕉&lt;br&gt;&quot;;
        }

}

?&gt;
```

**<span style="color: #ff0000;">FruitBase.php</span>**
```php
&lt;?php

namespace Ms6;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Fruit
 *
 * @author suixu
 */
class FruitBase extends FruitInface{

        //put your code he
        public $fruit;

        public function SetFruit($fruit) {
                $this-&gt;fruit = $fruit ;
        }
        public function eat(){
                if($this-&gt;fruit!=null){
                        $this-&gt;fruit-&gt;eat();
                }
        }

}

?&gt;
```

**<span style="color: #ff0000;">GreatEat.php</span>**
```php
&lt;?php
namespace Ms6;
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of GreatEat
 *
 * @author suixu
 */
class GreatEat extends FruitInface {
        //put your code here
        public function eat(){
                echo &quot;开始吃水果&lt;br&gt;&quot;;
        }
}

?&gt;
```

**<span style="color: #ff0000;">Ms6.php</span>**
```php
&lt;?php
chdir(dirname(__DIR__));
include &#039;App/Ms6/FruitInface.php&#039;;
include &#039;App/Ms6/GreatEat.php&#039;;
include &#039;App/Ms6/FruitBase.php&#039;;
include &#039;App/Ms6/FruitA.php&#039;;
include &#039;App/Ms6/FruitB.php&#039;;
include &#039;App/Ms6/FruitC.php&#039;;

$GreatEat = new \Ms6\GreatEat();
$A1 = new \Ms6\FruitA();
$B1 = new \Ms6\FruitB();
$C1 = new \Ms6\FruitC();

$B1-&gt;SetFruit($GreatEat);
$A1-&gt;SetFruit($B1);
$C1-&gt;SetFruit($A1);

$C1-&gt;eat();
```
