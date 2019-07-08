#!/bin/sh
: "${dbName:=racktables_db}"
: "${dbHost:=racktables_host}"
: "${dbPort:=3306}"
: "${dbUser:=racktables_user}"
: "${dbPass:=racktables_pwd}"

rm -fr /var/www/html/racktables/inc/secret.php
cat > /var/www/html/racktables/inc/secret.php <<EOF
<?php
\$pdo_dsn = 'mysql:host=${dbHost};port=${dbPort};dbname=${dbName}';
\$db_username = '${dbUser}';
\$db_password = '${dbPass}';
?>
EOF

adduser -D -g 'www' www && chown -R www:www /var/www/html && chmod -R 755 /var/www/html
chown www:www /var/www/html/racktables/inc/secret.php
chmod 440 /var/www/html/racktables/inc/secret.php

sed -i "s|;listen.owner\s*=\s*nobody|listen.owner = www|g" /etc/php5/php-fpm.conf
sed -i "s|;listen.group\s*=\s*nobody|listen.group = www|g" /etc/php5/php-fpm.conf
sed -i "s|;listen.mode\s*=\s*0660|listen.mode = 0660|g" /etc/php5/php-fpm.conf
sed -i "s|user\s*=\s*nobody|user = www|g" /etc/php5/php-fpm.conf
sed -i "s|group\s*=\s*nobody|group = www|g" /etc/php5/php-fpm.conf
sed -i "s|;log_level\s*=\s*notice|log_level = notice|g" /etc/php5/php-fpm.conf
sed -i "s|include = /etc/php5/fpm.d.*||g" /etc/php5/php-fpm.conf
sed -i "s|display_errors\s*=\s*Off|display_errors = On|i" /etc/php5/php.ini
sed -i "s|display_startup_errors\s*=\s*Off|display_startup_errors = On|i" /etc/php5/php.ini
sed -i "s|;*memory_limit =.*|memory_limit = 512M|i" /etc/php5/php.ini
sed -i "s|;*upload_max_filesize =.*|upload_max_filesize = 50M|i" /etc/php5/php.ini
sed -i "s|;*max_file_uploads =.*|max_file_uploads = 200|i" /etc/php5/php.ini
sed -i "s|;*post_max_size =.*|post_max_size = 100M|i" /etc/php5/php.ini
sed -i "s|;*cgi.fix_pathinfo=.*|cgi.fix_pathinfo = 0|i" /etc/php5/php.ini

echo "To initialize the db, first go to /?module=installer&step=5 | $@"

mkdir -p /run/nginx

exec "$@"

