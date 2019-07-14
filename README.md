# Racktables

![Logo](https://avatars1.githubusercontent.com/u/1536973?s=400&v=4)
![Racktables](https://www.racktables.org/img/logo.png)

[![Inline docs](http://inch-ci.org/github/JayBeeDe/Frq-Bash-Library.svg?branch=master)](http://inch-ci.org/github/JayBeeDe/Frq-Bash-Library) [![HitCount](http://hits.dwyl.com/JayBeeDe/Frq-Bash-Library.svg)](http://hits.dwyl.com/JayBeeDe/Frq-Bash-Library)

## What is racktables?

Racktables is a nifty and robust solution for datacenter and server room asset management. It helps document hardware assets, network addresses, space in racks, networks configuration and much much more!

[https://www.racktables.org/about.php](https://www.racktables.org/about.php)

## Quick reference

- [Official Website](https://www.racktables.org/about.php)

- [Wiki](https://wiki.racktables.org/index.php/Main_Page)

- [Contact](https://www.racktables.org/contacts.php)

- [IP address management Software Comparison](https://en.wikipedia.org/wiki/IP_address_management)

- [Bug Tracker](https://bugs.racktables.org/my_view_page.php)

- [License](https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html)

## How to use this image

`docker run -d -it --name racktables-db -e MYSQL_DATABASE=myNiceDbName -e MYSQL_USER=myNiceDbUserName -e MYSQL_PASSWORD=myNiceDbPassword -e MYSQL_ROOT_PASSWORD=myNiceROOTDbPassword --restart=always --hostname=racktables-db mysql:5.7 --character-set-server=utf8 --collation-server=utf8_unicode_ci
docker run -d -it --name racktables-ui --link racktables-db:mysql -e dbHost="racktables-db" -e dbName="myNiceDbName" -e dbUser="myNiceDbUserName" -e dbPass="myNiceDbPassword" --restart=always --hostname=racktables-ui jbd92/racktables:latest`

### Environment Variables

As you can see, there are several environment variables. Here is the full list <ith their default values:

Docker Environment Var. | Default Value | Description
------------- | ------------- | -------------
dbName | myNiceDbName | MySQL database name
dbHost | racktables_host | MySQL hostname
dbPort | 3306 | MySQL port
dbUser | myNiceDbUserName | MySQL user
dbPass | racktables_pwd | MySQL password

## License

This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation; [version 2](https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html) of the License.



