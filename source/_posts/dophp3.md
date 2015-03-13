title: 大话PHP面向对象---原型模式
tags:
  - PHP
  - 原型模式
  - 大话
  - 设计模式
  - 面向对象
id: 325
categories:
  - php
date: 2013-05-11 21:34:31
---

>《大话设计模式》通篇都是以情景对话的形式，用多个小故事或编程示例来组织讲解GoF总结的23个设计模式。原文程序语言为C#，本系列文章将其同思想转换为PHP语言，让PHP的面向对象设计模式更加容易学习！

<!--more-->

**<span style="color: #ff0000;">Resume.php</span>**
```php
&lt;?php

namespace Ms9;

/*
 *  
 *       ,==.              |~~~
 *      /  66\             |
 *      \c  -_)         |~~~
 *       `) (	        |
 *       /   \       |~~~
 *      /   \ \      |	encode UTF-8
 *     ((   /\ \_ |~~~	date 2013-3-6
 *      \\  \ `--` |	time 16:19:44
 *      / / /  |~~~	author lurrpis
 * ___ (_(___)_|	website http://www.ap1x.com
 * 
 */

class Resume {

    private $name;
    private $sex;
    private $age;

    function Resume($name) {
        $this-&gt;name = $name;
        $this-&gt;work = new \Ms9\WorkExperience();
    }

    //设置个人信息
    function SetPersonalInfo($sex, $age) {
        $this-&gt;sex = $sex;
        $this-&gt;age = $age;
    }

    //设置工作经历
    function SetWorkExperience($workDate,$company) {
        $this-&gt;work-&gt;WorkDate($workDate);
        $this-&gt;work-&gt;Company($company);
    }

    //显示
    function Display() {
        echo $this-&gt;name . &quot; &quot; . $this-&gt;sex . &quot; &quot; . $this-&gt;age;
        echo &quot;&lt;/br&gt;工作经历: &quot; . $this-&gt;work-&gt;workDate . &quot; &quot; . $this-&gt;work-&gt;company . &quot;&lt;/br&gt;&quot;;
    }
}

?&gt;
```

**<span style="color: #ff0000;">Resume2.php</span>**
```php
&lt;?php
namespace Ms9;
/*
 *  
 *       ,==.              |~~~
 *      /  66\             |
 *      \c  -_)         |~~~
 *       `) (	        |
 *       /   \       |~~~
 *      /   \ \      |	encode UTF-8
 *     ((   /\ \_ |~~~	date 2013-3-6
 *      \\  \ `--` |	time 17:19:08
 *      / / /  |~~~	author lurrpis
 * ___ (_(___)_|	website http://www.ap1x.com
 * 
 */
class Resume2{
    private $name;
    private $sex;
    private $age;
    private $timeArea;
    private $company;

    function Resume2($name){
        $this-&gt;name=$name;
    }

    //设置个人信息
    function SetPersonalInfo($sex,$age){
        $this-&gt;sex=$sex;
        $this-&gt;age=$age;
    }
    function SetWorkExperience($timeArea,$company){
        $this-&gt;timeArea=$timeArea;
        $this-&gt;company=$company;
    }
    //显示
    function Display(){
        echo $this-&gt;name.&quot; &quot;.$this-&gt;sex.&quot; &quot;.$this-&gt;age;
        echo &quot;&lt;/br&gt;工作经历: &quot;.$this-&gt;timeArea.&quot; &quot;.$this-&gt;company.&quot;&lt;/br&gt;&quot;;
    }
    function __clone(){
        $this-&gt;name=&#039;我是克隆的&#039;.$this-&gt;name;
    }
}
?&gt;
```

**<span style="color: #ff0000;">WorkExperience.php</span>**
```php
&lt;?php

namespace Ms9;

/*
 *  
 *       ,==.              |~~~
 *      /  66\             |
 *      \c  -_)         |~~~
 *       `) (	        |
 *       /   \       |~~~
 *      /   \ \      |	encode UTF-8
 *     ((   /\ \_ |~~~	date 2013-3-6
 *      \\  \ `--` |	time 16:15:06
 *      / / /  |~~~	author lurrpis
 * ___ (_(___)_|	website http://www.ap1x.com
 * 
 */

class WorkExperience {

    public $workDate;
    public $company;

    function WorkDate($workDate) {
        $this-&gt;workDate = $workDate;
    }

    function Company($company) {
        $this-&gt;company = $company;
    }

}

?&gt;
```

**<span style="color: #ff0000;">Ms9.php</span>**
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
 *      \\  \ `--` |	time 15:48:02
 *      / / /  |~~~	author lurrpis
 * ___ (_(___)_|	website http://www.ap1x.com
 * 
 */
chdir(dirname(__DIR__));

include &quot;App/Ms9/Resume.php&quot;;
include &quot;App/Ms9/WorkExperience.php&quot;;

$a = new \Ms9\Resume;
$a-&gt;Resume(&#039;大鸟&#039;);
$a-&gt;SetPersonalInfo(&quot;男&quot;, &quot;29&quot;);
$a-&gt;SetWorkExperience(&quot;1992-2001&quot;, &quot;XX公司&quot;);
$a-&gt;Display();

$b = clone $a;
$b-&gt;Resume(&#039;小小鸟&#039;);
//$b-&gt;SetPersonalInfo(&quot;男&quot;, &quot;23&quot;);
$b-&gt;SetWorkExperience(&quot;2003-2009&quot;, &quot;YY公司&quot;);
$b-&gt;Display();
$a-&gt;Display();

$c = clone $a;
//$c-&gt;Resume(&#039;大大鸟&#039;);
$c-&gt;SetPersonalInfo(&quot;女&quot;, &quot;18&quot;);
$c-&gt;SetWorkExperience(&quot;21231&quot;, &quot;xxxxxxxxxxxxxxxxx公司&quot;);
$c-&gt;Display();
?&gt;
```
