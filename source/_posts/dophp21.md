title: "[APT]入侵电视"
tags:
  - struct漏洞
  - 入侵电视
  - 机顶盒渗透
id: 1025
categories:
  - code
date: 2013-07-31 12:17:17
---

在乌云看到一篇不错的文章,入侵深圳某公司电视系统值得分享给童鞋们学习
以下为作者原话
---
>这么多年来,我只看国少许的对于电视机的入侵,现在在这个日益智能化的是时代里
什么都智能,什么都联网,这就对看似安全的智能化生活埋下了隐患。
这次就针对天威视讯的机顶盒进行电视机的渗透.不要惊奇,就是电视机
关于天威视讯的介绍,深圳几乎一半的电视终端都是使用天威视讯的,庞大的用户量,一旦发生问题,后果严重..
首先,这次渗透也是我突发奇想,看到电视机里有个ip设置的选项,和机顶盒背后那个网线插口二萌生的
我就在想如果将网线插入电脑,会不会获取到一样的ip？
于是我将插入电脑,这个时候我发现
如果你的机顶盒开机后插入网线到电脑,获取不到ip的,一定要将机顶盒关机后
插入网线,之后在开启机顶盒就能够正常获取到ip网关等一系列的信息
于是..之后大型的渗透就开始了...

<!--more-->

### 渗透过程

<span style="color: #008000;">机顶盒背后</span>
![1](http://old.lurrpis.com/wp-content/uploads/2013/07/1.png)
<span style="color: #008000;">查看ip</span>
![2](http://old.lurrpis.com/wp-content/uploads/2013/07/2.png)
<span style="color: #008000;"><span style="color: #ff0000;">ip</span>是以<span style="color: #ff0000;">10.97.143</span>这个段,而网关是<span style="color: #ff0000;">10.97.128.1</span></span>
<span style="color: #008000;"> dhcp服务器则是<span style="color: #ff0000;">192.168.222.105</span>,<span style="color: #ff0000;">dns</span>是<span style="color: #ff0000;">172.18.50.11</span>和<span style="color: #ff0000;">172.16.129.12</span></span>
<span style="color: #008000;"> 看到此画面的时候,我知道,这是个超级大的局域网,在电视中测试的时候,本来以为能够连接到外网,其实是这样的</span>
<span style="color: #008000;"> 如此便于生活的机顶盒,里面包含了很多便民服务,我在想,便民服务,如汽车违规查询,那查询应该是要连接外网的</span>
<span style="color: #008000;"> 但是在我实际测试之中,我发现,其实是这样的,我们本机利用遥控板点开查询页面,看是连接到了外网</span>
<span style="color: #008000;"> 其实呢,是连接到了天威自己制作的一个查询页面</span>
<span style="color: #008000;"> 当然,这个查询页面的服务器是连接外网的</span>
<span style="color: #008000;"> 也就是说,你本身<span style="color: #ff0000;">10.97.143.254</span>这个ip是不能够连接外网的,在我电脑上测试就证明了这点</span>
![3](http://old.lurrpis.com/wp-content/uploads/2013/07/3.png)
<span style="color: #008000;">Ping百度的域名,ip,和qq的域名,浏览器里也测试了是否能够访问,都不行</span>
<span style="color: #008000;"> 由此可以初步判断是这样的,那我们该从和处开始下手呢,我选择就从本机的ip段开始探索</span>
<span style="color: #008000;"> 我将<span style="color: #ff0000;">10.97.143</span>这个段填入IISPUT中进行对端口<span style="color: #ff0000;">80,8080,23,22</span>的扫描..</span>
![4](http://old.lurrpis.com/wp-content/uploads/2013/07/4.png)
<span style="color: #008000;">看到了吗,都是<span style="color: #ff0000;">80</span>端口,<span style="color: #ff0000;">23</span>端口,我随即打开了一个页面查看</span>
![5](http://old.lurrpis.com/wp-content/uploads/2013/07/5.png)
<span style="color: #008000;">要求验证,试了试常用的弱口令,都不能够登陆,我们现在可以推断</span>
<span style="color: #008000;"> 这些扫描肯定是跟电有关的,正在我郁闷的时候,想起了上面扫描的<span style="color: #ff0000;">23</span>端口可以测试,用telnet测试连接</span>
![6](http://old.lurrpis.com/wp-content/uploads/2013/07/6.png)
<span style="color: #008000;">Ok,可以连接,我猜测了常用的默认密码等..终于在我尝试到root 空密码的时候成功了,我擦,郁闷死我...</span>
<span style="color: #008000;"> 登陆成功</span>
![7](http://old.lurrpis.com/wp-content/uploads/2013/07/7.png)
<span style="color: #008000;">初步推测应该是智能机顶盒的终端...但是在随后的测试中,我发现,我错了...</span>
<span style="color: #008000;"> 通过web访问得知,需要登录,那就应该是路由器之类的..</span>
<span style="color: #008000;"> 不急,我首先阅遍了终端下的所有文件,找寻进一步渗透有用的东西..之后我突然发现了这个..</span>
![8](http://old.lurrpis.com/wp-content/uploads/2013/07/8.png)
<span style="color: #008000;">看到了吗,<span style="color: #ff0000;">action</span>,心里想,肯定存在<span style="color: #ff0000;">Struts</span>命令执行漏洞,于是,丢进利用工具里跑,与此同时</span>
<span style="color: #008000;"> 我发现了进入路由的方法,其实天威的验证做的很坑爹,天威的web验证界面其实就只是针对了home.asp这个页面而已</span>
<span style="color: #008000;"> 其他任何页面目录都形同虚设所以我们可以找到更改密码的地方,直接修改<span style="color: #ff0000;">admin</span>密码</span>
<span style="color: #008000;"><span style="color: #ff0000;"> adm/management.asp</span> 这个页面是修改密码的</span>
![9](http://old.lurrpis.com/wp-content/uploads/2013/07/9.png)
![10](http://old.lurrpis.com/wp-content/uploads/2013/07/10.png)
<span style="color: #008000;">我初步扫描了一下,最少都有<span style="color: #ff0000;">1000</span>多台,我们可以利用此漏洞控制成千甚至上万的无线路由器,危害可想而知</span>

<span style="color: #008000;">我们回到那个<span style="color: #ff0000;">Struts</span>漏洞上来,我测试了一些,存在Struts命令执行漏洞.人品大爆发,好玩的来了,兴奋</span>
![11](http://old.lurrpis.com/wp-content/uploads/2013/07/11.png)
![12](http://old.lurrpis.com/wp-content/uploads/2013/07/12.png)
<span style="color: #008000;">你知道我为什么看到这张图兴奋吗？因为这是电视机上显示的画面</span>
<span style="color: #008000;"> 一些未交钱的电视节目就是这个提示,这样我们就能够成功修改标题,入侵电视的目的达到</span>
![13](http://old.lurrpis.com/wp-content/uploads/2013/07/13.png)&lt;
<span style="color: #008000;">继续进一步渗透由此从<span style="color: #ff0000;">dhcp</span>服务器着手</span>
<span style="color: #008000;"> 本机的dhcp服务器是<span style="color: #ff0000;">192.168.222.105</span>,我抱着试试的心态扫描了一下关于<span style="color: #ff0000;">192.168.222.105</span>这个网段的ip,看看有什么可以利用的..</span>
![15](http://old.lurrpis.com/wp-content/uploads/2013/07/15.png)
<span style="color: #008000;">哇塞,兴奋了,这么多ip,直到我找到这个ip</span>
![16](http://old.lurrpis.com/wp-content/uploads/2013/07/16.jpg)
<span style="color: #008000;">看到没有,又是一个<span style="color: #ff0000;">action</span>后缀的文件,赶紧放工具里面跑跑看,有没有Struts命令执行漏洞,事实表明,有的,于是赶紧跑出登陆用户名和密码</span>
![17](http://old.lurrpis.com/wp-content/uploads/2013/07/17.png)
<span style="color: #008000;">进来之后就觉得碉堡了,基本上,天威的所有<span style="color: #ff0000;">ip</span>我都能够查询的到</span>
![18](http://old.lurrpis.com/wp-content/uploads/2013/07/18.jpg)
![19](http://old.lurrpis.com/wp-content/uploads/2013/07/19.png)
<span style="color: #008000;">能够查询到任意一台机顶盒的上线记录等..为了进一步的渗透,我添加了一个管理员账户</span>
<span style="color: #008000;"> 之后登陆上<span style="color: #ff0000;">3389</span>之后,之后当我用<span style="color: #ff0000;">administrator</span>用户登陆之后,打开<span style="color: #ff0000;">Navicat for Mysql</span>软件的时候,众多数据库暴漏.</span>
![20](http://old.lurrpis.com/wp-content/uploads/2013/07/20.png)
<span style="color: #008000;">可想而知的危害..看看这下载速度</span>
![21](http://old.lurrpis.com/wp-content/uploads/2013/07/21.png)
<span style="color: #008000;">当我查看共享的时候,吓尿了...全是企业内部资料..</span>
<span style="color: #008000;"> 如果这些资料泄露不堪设想</span>
![22](http://old.lurrpis.com/wp-content/uploads/2013/07/22.png)
![23](http://old.lurrpis.com/wp-content/uploads/2013/07/23.jpg)
![25](http://old.lurrpis.com/wp-content/uploads/2013/07/25.png)
<span style="color: #008000;">到这里,我们的渗透基本完成</span>