title: Laravel 4.2 Nginx+Apache下重写Rewrite规则
tags:
  - apache
  - laravel
  - nginx
id: 1272
categories:
  - php
date: 2015-02-06 09:35:02
---

###Apache .htaccess
目录为`webroot/abc/public/index.php`
####public 目录下
```
Options -MultiViews
RewriteEngine On
 # Handle Front Controller...
 RewriteCond %{REQUEST_FILENAME} !-d
 RewriteCond %{REQUEST_FILENAME} !-f
 RewriteRule ^ index.php [L]
```
####abc 目录下
```
RewriteEngine on
RewriteRule ^(.*)$ public/$1 [L]
```
####webroot 目录下
```
RewriteEngine on
RewriteRule ^(.*)$ abc/$1 [L]
```

###Nginx conf
```
server {
    listen      80;
    server_name sina.nginx.com;

    location / {
        root /Users/lurrpis/webroot/WeiBo_university/www/public;
        index index.php index.html;
        try_files $uri $uri/ /index.php?$query_string;
    }
    location ~ \.php$ {
        root           /Users/lurrpis/webroot/WeiBo_university/www/public;
        fastcgi_pass   127.0.0.1:9000;
        fastcgi_index  index.php;
        fastcgi_param  SCRIPT_FILENAME  $document_root$fastcgi_script_name;
        include        fastcgi_params;
    }
}
```