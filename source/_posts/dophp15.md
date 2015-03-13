title: "[视频]利用磁卡关闭ATM,银行磁卡写入数据"
tags:
  - 入侵ATM
  - 磁卡溢出
id: 627
categories:
  - code
date: 2013-05-23 19:59:38
---

### 前言
>ATM作为一种重要的银行终端和交易平台，如何维护和管理好持卡人和银行的数据一直是ATM安全首要考虑的问题
近日无线安全研究者、自称在加拿大从事洗碗工作的Kevin2600发现一个ATM机的漏洞，可利用磁卡导致ATM关机。并且经过测试，在关机之前，磁卡还可以退出ATM机，Kevin2600带来了现场操作视频

<!--more-->

<div style="text-align: center;"><object width="520" height="400" classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,40,0" align="middle"><param name="src" value="http://player.youku.com/player.php/sid/XNTQ3ODcxOTIw/v.swf" /><param name="allowfullscreen" value="true" /><param name="quality" value="high" /><param name="allowscriptaccess" value="always" /><embed width="520" height="400" type="application/x-shockwave-flash" src="http://player.youku.com/player.php/sid/XNTQ3ODcxOTIw/v.swf" allowfullscreen="true" quality="high" allowscriptaccess="always" align="middle" /></object></div>


### 个人想法

银行磁卡 可写入数据应该不多 未必可以做到任意命令执行

就像一个溢出点 可覆盖区域太小只能写入几个字节无限jump 造成DDOS

```bash
|shutdonw -s|
```

或许可以用多张磁卡做到
“发现个ATM机的BUG”注意到是Bug 也有可能是类似逻辑性错误进行的有限利用