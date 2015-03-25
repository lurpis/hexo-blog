title: opensuse12.3-Chrome无法安装支付宝安全控件
tags:
  - aliedit
  - 支付宝控件
  - 无法安装
id: 1003
categories:
  - code
date: 2013-07-22 19:56:02
---

### 前言

回家重装了一下`OPENSUSE`，登录淘宝，发现无法输入支付密码，

于是按照提示下载`aliedit.tar.gz`，解压后执行
```bash
sudo sh aliedit
```
提示安装成功，可是重启浏览器和机器后依然显示没有安装控件，换Firefox,Opera依然是这个问题，捣鼓了半天未果。

有急事就出门了，两天后回家，发现问题依然存在，所以静下心找到了解决方法，在这里记录一下。

<!--more-->

### 解决方法

无法安装的原因是缺少libpng12这个是很老旧的包。

所以在fedora或者suse这种激进的系统，默认是不安装的。

如果是fedora的话，这个包还不能直接安装呢。

所以我们从源里安装一下这个包，问题就解决了，代码如下
```bash
sudo zypper in libpng12-0
```