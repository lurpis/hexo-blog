title: "如何在Laravel中使用SMTP发送邮件(适用于各主流邮箱)"
id: 12
date: 2015-03-13 12:05:49
categories:
  - code
tags:
  - laravel
  - 发送邮件
  
---
>Laravel 提供了非常简单的邮件发送 API，但是文档却不是太清晰，再加上它采用传递闭包（回调函数）的方式调用，导致邮件发送的使用门槛偏高。

>Laravel 4 和 Laravel 5 的邮件发送使用方式完全一致。Laravel 5 的邮件发送中文文档在：[http://laravel-china.org/docs/5.0/mail](http://laravel-china.org/docs/5.0/mail)

>本文中，我将以 163 邮箱为例，展示如何用 Laravel 内置的邮件发送类来发送邮件。

###配置
修改邮件发送配置。4.2 在 `app/config/mail.php`，5 在 `config/mail.php`，修改以下配置：
```php
'host' => 'smtp.163.com',
'port' => 25,
'from' => array('address' => '***@163.com', 'name' => 'TestMail'),
'username' => '***@163.com', // 注意，这里必须和上一行配置里面的邮件地址一致
'password' => '****',
```
###发送
在控制器或者模型里，调用以下代码：
```php
$data = ['email'=>$email, 'name'=>$name, 'uid'=>$uid, 'activationcode'=>$code];
return Mail::send('activemail', $data, function($message) use($data)
{
    $message->to($data['email'], $data['name'])->subject('欢迎注册我们的网站，请激活您的账号！');
});
```
邮件视图为 `views/activemail.blade.php`：
```
<!doctype html>
<html lang="zh-CN">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
  </head>
<body>
  <a href="{{ URL('active?uid='.$uid.'&activationcode='.$activationcode) }}" target="_blank">点击激活你的账号</a>
</body>
</html>
```
###搞定!
------
转载自吕文瀚-岁寒[http://lvwenhan.com/laravel/436.html](http://lvwenhan.com/laravel/436.html)