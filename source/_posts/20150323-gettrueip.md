title: "绕过代理获取访客真实IP"
id: 22
date: 2015-03-23 17:30:19
categories:
  - code
tags:
  - 绕过代理
  - 获取真实IP
  
---
###前言
>相信许多码哥在项目中都遇到`如何处理代理上网用户`的头疼问题，这里转发GitHub上某大牛解决此问题的`JavaScript`。

项目地址:[https://github.com/diafygi/webrtc-ips](https://github.com/diafygi/webrtc-ips)

Firefox 跟 Chrome 支持WebRTC可以向STUN服务器请求，返回内外网IP，不同于XMLHttpRequest请求，STUN请求开发者工具当中看不到网络请求的。 

演示地址:[http://p2j.cn/tools/ip.html](http://p2j.cn/tools/ip.html)

###代码
```javascript
//get the IP addresses associated with an account
function getIPs(callback){
    var ip_dups = {};
 
    //compatibility for firefox and chrome
    var RTCPeerConnection = window.RTCPeerConnection
        || window.mozRTCPeerConnection
        || window.webkitRTCPeerConnection;
    var mediaConstraints = {
        optional: [{RtpDataChannels: true}]
    };
 
    //firefox already has a default stun server in about:config
    //    media.peerconnection.default_iceservers =
    //    [{"url": "stun:stun.services.mozilla.com"}]
    var servers = undefined;
 
    //add same stun server for chrome
    if(window.webkitRTCPeerConnection)
        servers = {iceServers: [{urls: "stun:stun.services.mozilla.com"}]};
 
    //construct a new RTCPeerConnection
    var pc = new RTCPeerConnection(servers, mediaConstraints);
 
    //listen for candidate events
    pc.onicecandidate = function(ice){
 
        //skip non-candidate events
        if(ice.candidate){
 
            //match just the IP address
            var ip_regex = /([0-9]{1,3}(\.[0-9]{1,3}){3})/
            var ip_addr = ip_regex.exec(ice.candidate.candidate)[1];
 
            //remove duplicates
            if(ip_dups[ip_addr] === undefined)
                callback(ip_addr);
 
            ip_dups[ip_addr] = true;
        }
    };
 
    //create a bogus data channel
    pc.createDataChannel("");
 
    //create an offer sdp
    pc.createOffer(function(result){
 
        //trigger the stun server request
        pc.setLocalDescription(result, function(){});
 
    }, function(){});
}
 
//Test: Print the IP addresses into the console
getIPs(function(ip){console.log(ip);});
```

**测试了下，灰常牛逼啊。**