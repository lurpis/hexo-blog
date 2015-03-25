title: "Apache和nginx的反向代理配置"
id: 7
date: 2015-03-10 22:50:36
categories:
  - code
tags:
  - nginx
  - apache
  - 反向代理proxy
  
---
###引言
>`nginx`一直是做反向代理的利器，但若遇到老项目新需求需要用到反向代理，偏偏服务器又是使用的`Apache`，迁移成本太高，就得研究`Apache`下的反向代理了。

####Apache下配置反向代理
这次需求是`php`,`nodejs`共存，将访问`http://xxx.com/api/v1`的请求转发到`8001端口`
#####首先确定Apache开启了Proxy模块
检查`httpd.conf`是否开启以下模块

```
LoadModule proxy_module modules/mod_proxy.so
LoadModule proxy_connect_module modules/mod_proxy_connect.so
LoadModule proxy_ftp_module modules/mod_proxy_ftp.so
LoadModule proxy_http_module modules/mod_proxy_http.so
```

#####接着在配置服务器处

```
<VirtualHost *:80>
    ServerAdmin xurs@xxx.com
    DocumentRoot /home/www/html
    ServerName xxx.com                                                         
    ErrorLog logs/xxx.com-error_log                                              
    CustomLog logs/xxx.com-access_log common                                     

    ProxyPreserveHost On
    ProxyPass /api/v1 http://127.0.0.1:8001
    ProxyPassReverse /api/v1 http://127.0.0.1:8001                               
</VirtualHost>    
```

#####保存，执行

```
service httpd restart
```
访问`http://xxx.com/api/v1`即可实现将请求转发到`8001端口`

####nginx下配置反向代理
`nginx`就是做反向代理出生的专业户，自然很好配置
#####打开nginx.conf
在`http{   }`中末尾添加
```
upstream appsvr{ 
	server 127.0.0.1:8001;    
}
```
#####打开server.conf
在`server{   }`中末尾添加
```
location ~.*/(api/v1/) {
	proxy_pass http://appsvr;
	proxy_redirect off;
	proxy_set_header Host $host;
	proxy_set_header X-Real-IP $remote_addr;
	proxy_set_header X-Forwarded-For $remote_addr;
	proxy_set_header Access-Control-Allow-Origin 	$http_origin;

	client_max_body_size 200k;
	client_body_buffer_size 128k;

	proxy_connect_timeout 3;
	proxy_send_timeout 3;
	proxy_read_timeout 3;
	proxy_buffer_size 4k;
	proxy_buffers 4 32k;
	proxy_busy_buffers_size 64k;
	proxy_temp_file_write_size 64k;
	keepalive_timeout 0;
}
```
#####保存，执行

```
nginx -s reload
```
访问`http://xxx.com/api/v1`即可实现将请求转发到`8001端口`
