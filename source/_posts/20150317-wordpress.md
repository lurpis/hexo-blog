title: "WordPress分类页代码"
id: 17
date: 2015-03-17 14:57:13
categories:
  - code
tags:
  - WordPress
  
---
###前言
今天做需求时，突然发现很久以前使用WordPress写的一个项目的分类功能不能使用了，分类页面内的文章并没有进行分类，原来是WordPress之后更新，出现了兼容性BUG

####文件路径
```
webroot/wp-content/themes/xxx/archive.php  //分类模板
```
查找`have_posts()`，一般这句话之下就是文章列表遍历
在`have_posts()`之上插入，
```php
$categories = get_the_category($post->ID);
$args = array(
                'cat'=>$categories[0]->term_id,   //当前分类文章
                'showposts' => 20,  //文章列表分页
                'paged' => $paged
            );
            query_posts($args);
```

####做个广告
<a href='http://www.evhui.com' target='_blank' style='color:red'>电车汇 evhui.com</a>是一个聚合关于新能源电动车的最新政策，国家福利，新能源补贴，评测，充电桩定位(后续产品)的电车资源首发网站。

一开始让我说他们有独家政策补贴消息其实我是拒绝的，因为，你不能让我说，我就马上去说，第一我要试一下，因为我不愿意说完了以后再加一些特技上去，政策补贴duang~~一下，很多，很假，这样人们出来一定会骂我，根本没有这样的补贴，就证明上面那个是假的，后来我也经过证实他们消息确实是独家的，我关注了大概一个月左右，感觉还不错，后来我在的时候也要求他们不要加特技，因为我要让人们看到，算好政策补贴买电动车 <i class="fa fa-car"></i> 就像买电动车 <i class="fa fa-bicycle"></i>