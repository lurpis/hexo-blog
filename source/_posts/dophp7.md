title: 大话PHP面向对象---建造者模式
tags:
  - PHP
  - 大话
  - 建造者
  - 设计模式
  - 面向对象
id: 334
categories:
  - php
date: 2013-05-11 21:50:35
---

>《大话设计模式》通篇都是以情景对话的形式，用多个小故事或编程示例来组织讲解GoF总结的23个设计模式。原文程序语言为C#，本系列文章将其同思想转换为PHP语言，让PHP的面向对象设计模式更加容易学习！

<!--more-->
**<span style="color: #ff0000;">Builder.php</span>**
```php
&lt;?php
namespace Ms13;
/*
 *  
 *       ,==.              |~~~
 *      /  66\             |
 *      \c  -_)         |~~~
 *       `) (	        |
 *       /   \       |~~~
 *      /   \ \      |	encode UTF-8
 *     ((   /\ \_ |~~~	date 2013-3-13
 *      \\  \ `--` |	time 14:08:39
 *      / / /  |~~~	author lurrpis
 * ___ (_(___)_|	website http://www.ap1x.com
 * 
 */

abstract class Builder{
    public abstract function BuildPartA();
    public abstract function BuildPartB();
    public abstract function GetResult();
}
?&gt;
```

**<span style="color: #ff0000;">ConcreteBuilder1.php</span>**
```php
&lt;?php
namespace Ms13;
/*
 *  
 *       ,==.              |~~~
 *      /  66\             |
 *      \c  -_)         |~~~
 *       `) (	        |
 *       /   \       |~~~
 *      /   \ \      |	encode UTF-8
 *     ((   /\ \_ |~~~	date 2013-3-13
 *      \\  \ `--` |	time 16:40:33
 *      / / /  |~~~	author lurrpis
 * ___ (_(___)_|	website http://www.ap1x.com
 * 
 */

class ConcreteBuilder1 extends Builder{
    function __construct() {
        $this-&gt;product = new \Ms13\Product();
    }
    public function BuildPartA() {
        $this-&gt;product-&gt;Add(&#039;部件A&#039;);
    }
    public function BuildPartB() {
        $this-&gt;product-&gt;Add(&#039;部件B&#039;);
    }
    public function GetResult() {
        return $this-&gt;product;
    }
}
?&gt;
```

**<span style="color: #ff0000;">ConcreteBuilder2.php</span>**
```php
&lt;?php
namespace Ms13;
/*
 *  
 *       ,==.              |~~~
 *      /  66\             |
 *      \c  -_)         |~~~
 *       `) (	        |
 *       /   \       |~~~
 *      /   \ \      |	encode UTF-8
 *     ((   /\ \_ |~~~	date 2013-3-13
 *      \\  \ `--` |	time 16:48:43
 *      / / /  |~~~	author lurrpis
 * ___ (_(___)_|	website http://www.ap1x.com
 * 
 */
class ConcreteBuilder2 extends Builder{
    function __construct() {
        $this-&gt;product = new \Ms13\Product();
    }
    public function BuildPartA() {
        $this-&gt;product-&gt;Add(&#039;部件X&#039;);
    }
    public function BuildPartB() {
        $this-&gt;product-&gt;Add(&#039;部件Y&#039;);
    }
    public function GetResult() {
        return $this-&gt;product;
    }
}
?&gt;
```

**<span style="color: #ff0000;">Director.php</span>**
```php
&lt;?php
namespace Ms13;
/*
 *  
 *       ,==.              |~~~
 *      /  66\             |
 *      \c  -_)         |~~~
 *       `) (	        |
 *       /   \       |~~~
 *      /   \ \      |	encode UTF-8
 *     ((   /\ \_ |~~~	date 2013-3-13
 *      \\  \ `--` |	time 16:51:55
 *      / / /  |~~~	author lurrpis
 * ___ (_(___)_|	website http://www.ap1x.com
 * 
 */
class Director{
    public function Construct($builder){
        $builder-&gt;BuildPartA();
        $builder-&gt;BuildPartB();
    }
}
?&gt;
```

**<span style="color: #ff0000;">IList.php</span>**
```php
&lt;?php
namespace Ms13;
/*
 *  
 *       ,==.              |~~~
 *      /  66\             |
 *      \c  -_)         |~~~
 *       `) (	        |
 *       /   \       |~~~
 *      /   \ \      |	encode UTF-8
 *     ((   /\ \_ |~~~	date 2013-3-13
 *      \\  \ `--` |	time 15:43:57
 *      / / /  |~~~	author lurrpis
 * ___ (_(___)_|	website http://www.ap1x.com
 * 
 */
class IList{
    public $elementData = array();
    protected $size=0;
    public function Add($element){
        $this-&gt;elementData[$this-&gt;size]=$element;
        $this-&gt;size++;
    }
    public function Get($key){
        if($this-&gt;rangeCheck($key)){
            return $this-&gt;elementData[$key];
        }
    }
    public function Delete($element){
        foreach ($this-&gt;elementData as $key =&gt; $value){
            if($element == $value){
                $this-&gt;remove($key);
                return true;
            }
        }
        return false;
    }
    public function remove($key){
        if($this-&gt;rangeCheck($key)){
            for($i=$key;$i&lt;$this-&gt;size;$i++){
                $this-&gt;elementData[$i] =  $this-&gt;elementData[$i+1];
            }
            $this-&gt;size--;
            return TRUE;
        }
        return FALSE;
    }
    public function rangeCheck($key){
        if ($key &lt; $this-&gt;size)
            return TRUE;
        return FALSE;
    }
    public function size(){
        return $this-&gt;size;
    }
    public function clear(){
        foreach ($this-&gt;elementData as $key=&gt;$value){
            $this-&gt;elementData[$key]=&#039;&#039;;
        }
        $this-&gt;size=0;
    }
    public function isEmpty(){
        return $this-&gt;size == 0;
    }
}
?&gt;
```

**<span style="color: #ff0000;">Product.php</span>**
```php
&lt;?php
namespace Ms13;
/*
 *  
 *       ,==.              |~~~
 *      /  66\             |
 *      \c  -_)         |~~~
 *       `) (	        |
 *       /   \       |~~~
 *      /   \ \      |	encode UTF-8
 *     ((   /\ \_ |~~~	date 2013-3-13
 *      \\  \ `--` |	time 13:58:52
 *      / / /  |~~~	author lurrpis
 * ___ (_(___)_|	website http://www.ap1x.com
 * 
 */

class Product{
   function __construct() {
       $this-&gt;parts = new \Ms13\IList();
   }
    public function Add($part){
        $this-&gt;parts-&gt;Add($part);
    }
    public function Show(){
        echo &quot;产品 创建 --- &lt;/br&gt;&quot;;
        foreach ($this-&gt;parts-&gt;elementData as $value){
            echo $value;
        }
    }
}
?&gt;
```

**<span style="color: #ff0000;">Ms13.php</span>**
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
 *     ((   /\ \_ |~~~	date 2013-3-13
 *      \\  \ `--` |	time 16:59:49
 *      / / /  |~~~	author lurrpis
 * ___ (_(___)_|	website http://www.ap1x.com
 * 
 */
chdir(dirname(__DIR__));

include &#039;App/Ms13/Builder.php&#039;;
include &#039;App/Ms13/ConcreteBuilder1.php&#039;;
include &#039;App/Ms13/ConcreteBuilder2.php&#039;;
include &#039;App/Ms13/Director.php&#039;;
include &#039;App/Ms13/IList.php&#039;;
include &#039;App/Ms13/Product.php&#039;;

$director = new \Ms13\Director();
$builder1 = new \Ms13\ConcreteBuilder1();
$builder2 = new \Ms13\ConcreteBuilder2();

$director-&gt;Construct($builder1);
$part1 = $builder1-&gt;GetResult();
$part1-&gt;Show();
?&gt;
```
