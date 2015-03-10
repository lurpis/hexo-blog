title: Zendframework2 路由跳转用法笔记
tags:
  - toRoute
  - zendframework2
id: 739
categories:
  - php
date: 2013-05-25 19:03:34
---

### 以下是三种用法例子

```php
$this-&gt;forward()-&gt;dispatch(&#039;Manager\Controller\Register&#039;, array(
&#039;action&#039; =&gt; &#039;register&#039;
));
```
```php
$this-&gt;redirect()-&gt;toUrl( &#039;/&#039; );
```
```php
return $this-&gt;redirect()-&gt;toRoute(&#039;News&#039;, array(
&#039;controller&#039; =&gt; &#039;News\Controller\News&#039;,
&#039;action&#039; =&gt; &#039;add&#039;
));
```