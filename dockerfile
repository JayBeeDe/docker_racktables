FROM alpine:3.7
MAINTAINER jaybee jbdelon@linagora.com

ARG racktablesVersion="latest"

COPY entrypoint.sh /entrypoint.sh
COPY supervisord.conf /etc/supervisord.conf

RUN apk --no-cache add nginx php5-fpm php5-mcrypt php5-soap php5-openssl php5-gmp php5-pdo_odbc php5-json php5-dom php5-pdo php5-zip php5-mysql php5-mysqli php5-sqlite3 php5-apcu php5-pdo_pgsql php5-bcmath php5-gd php5-odbc php5-pdo_mysql php5-pdo_sqlite php5-gettext php5-xmlreader php5-xmlrpc php5-bz2 php5-mssql php5-iconv php5-pdo_dblib php5-curl php5-ctype nano supervisor
RUN if [ "$racktablesVersion" != "latest" ]; then racktablesVersionURL="RackTables-$racktablesVersion.zip"; else racktablesVersionURL="latest"; fi && mkdir -p /var/www/html/racktables && wget https://sourceforge.net/projects/racktables/files/$racktablesVersionURL/download -O /var/www/html/racktables/racktables.zip -q && unzip /var/www/html/racktables/racktables.zip -d /var/www/html/racktables/ && racktablesVersion2=$(ls -1 /var/www/html/racktables/ | grep "RackTables-" | tail -n 1) && mv /var/www/html/racktables/$racktablesVersion2/wwwroot/* /var/www/html/racktables/ && rm -fr /var/www/html/racktables/$racktablesVersion2/ && rm -fr /var/www/html/racktables/racktables.zip && chmod 755 /entrypoint.sh

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/bin/supervisord"]
