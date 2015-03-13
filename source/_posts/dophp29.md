title: home下生成libpeerconnection.log解决方法
tags:
  - Linux Chrome
  - libpeerconnection
id: 948
categories:
  - code
date: 2013-07-08 16:45:12
---

### 解决方法
这几天无意发现在<span style="color: #ff0000;">/home/lurrpis</span>下生成<span style="color: #ff0000;">libpeerconnection.log</span>，
删除后再次出现，Google后发现是Chrome浏览器所生成的临时文件，
可是总不能在我的用户根目录下撒野吧，所以现在贴上中文的解决方法。

编辑此文件[需要ROOT权限]
```bash
/opt/google/chrome/google-chrome
```
找到下面这行代码
```bash
exec-a &quot;$ 0&quot; &quot;$ HERE / chrome&quot; &quot;$ @&quot;
```
在这行代码前添加
```bash
cd /tmp
```
保存

这样<span style="color: #ff0000;">libpperconnection.log</span>就会被生成在<span style="color: #ff0000;">/tmp</span>下了。