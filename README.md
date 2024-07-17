## Live Helper Chat

Version of integration **V2**

* Sample URL's which are handled by Laravel, but are using LHC classes
  * `https://example.com/site_admin/logged` - this routes requires `lhfront`,`default` permissions. Modify it for production to avoid printing user details
  * `https://example.com/anonymous` - this route does not require any permission and does not set any cookie.
  * `https://example.com/site_admin/login` - this route shows how to redirect to LHC internal URL even if URL route is registered in Laravel.

Now you can use any LHC class within Laravel routes. Where this option was missing in first version.

* `site_admin` routes should be defined in `routes/admin.php` you will find also sample how to require permissions for specific URL.
* Cookieless routes should be defined in `routes/anonymous.php` route file.

This allows two apps to work independently and have independent commit history.

For the most common Live Helper Chat classes read 

 * https://doc.livehelperchat.com/docs/development/orm to work with LHC database most common methods
 * https://doc.livehelperchat.com/docs/development/common-classes the most commit LHC classes

Requirment
* php 7.3 | 8.0
* mysql
* composer version
* 

```shell script
composer install OR composer update
cp .env.example .env
php artisan key:generate
cd public
mv livehelperchat-master livehelperchat
ln -s livehelperchat/lhc_web/ezcomponents
ln -s livehelperchat/lhc_web/lib
ln -s livehelperchat/lhc_web/modules
ln -s livehelperchat/lhc_web/pos
ln -s livehelperchat/lhc_web/extension
ln -s livehelperchat/lhc_web/design
ln -s livehelperchat/lhc_web/translations
ln -s livehelperchat/lhc_web/var
ln -s livehelperchat/lhc_web/settings
ln -s livehelperchat/lhc_web/cache
chown apache:apache -R cache/
chown apache:apache -R var/
chown apache:apache settings/
chmod -R 755 cache/
php artisan serve
```

Folder structure at the end should look like

![See image](https://raw.githubusercontent.com/LiveHelperChat/livehelperchat_laravel/master/public/structure.png)

Your have to setup virtual host on your server pointing to `livehelperchat_laravel/public` same as default laravel installation

You now might need to follow standard Laravel install procedure.

After install don't forget to edit `.env` file and put database logins.

Now in any extension or core file you should be able to use any Laravel class and vica versa.

## Setup for backend webhook with Express.js

Requirement
* node module V.18
* npm version
* Ngrok authenticate
* database connect to livehelperchat

## NOTES

* rename at folder livehelperchat-master || mv livehelperchat-master livehelperchat
* perbaikan FE ada di route:"/chat"|| views/chat.blade.php
* Folder html nya ada di /public/widget
* inject database in folder Webhook-js/database.sql to mysql
* port connection database default: admin/updatadata/8889
* setup in folder database /public/settings/settings.ini.php
* masih error ngepost ke db pakai NGROK

## MADE IN KONGO

<p align="center"><a href="https://laravel.com" target="_blank"><img src="https://raw.githubusercontent.com/laravel/art/master/logo-lockup/5%20SVG/2%20CMYK/1%20Full%20Color/laravel-logolockup-cmyk-red.svg" width="400"></a></p>

<p align="center">
<a href="https://travis-ci.org/laravel/framework"><img src="https://travis-ci.org/laravel/framework.svg" alt="Build Status"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/dt/laravel/framework" alt="Total Downloads"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/v/laravel/framework" alt="Latest Stable Version"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/l/laravel/framework" alt="License"></a>
</p>