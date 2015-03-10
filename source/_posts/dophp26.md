title: GitHub入门教程
tags:
  - github使用教程
  - git入门教程
id: 994
categories:
  - code
date: 2013-07-10 20:45:44
---

这里主要介绍项目环境搭建时的Git本地仓库的建立及使用。
以GitHub Linux下的使用为例,刚才在GitHub上建立了网络仓库,
地址:`https://github.com/lurrpis/jxtime.git`

<!--more-->

### GitHub使用教程

1. 在源里安装git-gui后，打开Shell，配置自己的Git信息
<span style="color: #ff0000;">$git config --global user.name "lurrpis"   <span style="color: #00ff00;"> <span style="color: #339966;">//lurrpis为你自己的名字</span></span></span>
<span style="color: #ff0000;"> $git config --global user.email "admin@ap1x.com"    <span style="color: #339966;">//邮箱也改为你自己</span></span>

2. 进入想要创建本地仓库的路径
<span style="color: #ff0000;">$cd /home/lurrpis/website/Zendframework2</span>

3. 创建本地仓库文件夹
<span style="color: #ff0000;">$mkdir jxtime    <span style="color: #339966;">//这里的仓库名字要与GitHub上的仓库名称相同</span></span>

4. 进入仓库文件夹
<span style="color: #ff0000;">$cd jxtime</span>

5. 初始化本地仓库
<span style="color: #ff0000;">$git init</span>

6. 创建一个测试文件
<span style="color: #ff0000;">$touch test.txt</span>

7. 添加text.txt进入上传队列
<span style="color: #ff0000;">$git add test.txt</span>

8. 缓存提交，引号中的是对本次提交的描述，必须填写，不能为空
<span style="color: #ff0000;">$git commit -m 'first commit test'</span>

9. 查看分支
<span style="color: #ff0000;">$git branch    <span style="color: #339966;">//这时你会查看到* master</span></span>

10. 建立自己的分支
<span style="color: #ff0000;">$git branch lurrpis   <span style="color: #339966;"> //创建名叫lurrpis的分支</span></span>

11. 再次查看分支
<span style="color: #ff0000;">$git branch    <span style="color: #339966;">//这是你会查看到 * master lurrpis</span></span>

12. 切换到自己的分支
<span style="color: #ff0000;">$git checkout lurrpis</span>

13. 再次查看分支
<span style="color: #ff0000;">$git branck    <span style="color: #339966;">//这时你会查看到 master * lurrpis</span></span>

14. 给仓库重命名，注意url格式，lurrpis是你注册时的昵称，jxtime是你刚才建立的版本仓库
<span style="color: #ff0000;">$git remote add origin https://github.com/lurrpis/jxtime.git</span>

15. 提交分支
<span style="color: #ff0000;">$git push origin lurrpis   <span style="color: #339966;"> //这时你就可以看到在http://github.com/lurrpis/jxtime里lurrpis更新的分支了</span></span>

16. 获得最新的项目文件（从服务器下载）
<span style="color: #ff0000;">$git pull https://github.com/lurrpis/jxtime.git lurrpis</span>