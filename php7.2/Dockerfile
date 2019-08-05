FROM php:7.2.0-fpm
USER root

# 修改软件源
#ADD sources.list /home/sources.list
#RUN mv /home/sources.list /etc/apt/sources.list
# 安装swoole需要安装openssl libssl-dev
RUN apt-get update && apt-get -y install rsync openssh-client openssh-server wget git openssl libssl-dev libzip-dev libpng-dev
#RUN docker-php-ext-install sockets && docker-php-ext-install bcmath && docker-php-ext-install pdo_mysql
RUN docker-php-ext-install bcmath && docker-php-ext-install pdo_mysql
RUN pecl install xdebug && docker-php-ext-enable xdebug && pecl install redis && docker-php-ext-enable redis \
    &&  pecl install zip && docker-php-ext-enable zip && docker-php-ext-install opcache && docker-php-ext-enable opcache \
    && pecl install mongodb && docker-php-ext-enable mongodb
RUN cd /usr/src && docker-php-source extract && cd /usr/src/php/ext/gd && phpize && ./configure && make && make install && docker-php-ext-enable gd && cd / && docker-php-source delete
RUN mkdir -p /var/run/sshd
WORKDIR /home/www
ADD init.sh /home
#ADD php/php.ini /usr/local/etc/php
RUN chmod a+x /home/init.sh

#安装开发相关
#RUN cd /home && \
#    wget https://github.com/squizlabs/PHP_CodeSniffer/releases/download/3.4.1/phpcs.phar && \
#    wget https://github.com/squizlabs/PHP_CodeSniffer/releases/download/3.4.1/phpcbf.phar && \
#    wget http://apps.jnguo.cn:8080/apps/phpmd.phar && \
#    wget https://github.com/FriendsOfPHP/PHP-CS-Fixer/releases/download/v2.14.2/php-cs-fixer.phar && \
#    wget http://phar.phpunit.cn/phpunit.phar && \
#    wget https://getcomposer.org/download/1.8.4/composer.phar && \
#    mv /home/phpcs.phar /usr/local/bin/phpcs  && \
#    chmod +x /usr/local/bin/phpcs && \
#    mv /home/phpcbf.phar /usr/local/bin/phpcbf && \
#    chmod +x /usr/local/bin/phpcbf && \
#    mv /home/phpmd.phar /usr/local/bin/phpmd && \
#    chmod +x /usr/local/bin/phpmd && \
#    mv /home/php-cs-fixer.phar /usr/local/bin/php-cs-fixer && \
#    chmod +x /usr/local/bin/php-cs-fixer && \
#    mv /home/phpunit.phar /usr/local/bin/phpunit && \
#    chmod +x /usr/local/bin/phpunit && \
#    mv /home/composer.phar /usr/local/bin/composer && \
#    chmod +x /usr/local/bin/composer

#安装swoole拓展
#RUN cd /home && wget https://github.com/swoole/swoole-src/archive/v4.3.1.tar.gz && \
#    tar -zxvf v4.3.1.tar.gz && \
#    cd swoole-src-4.3.1 && \
#    phpize && ./configure --enable-coroutine --enable-openssl --enable-http2  --enable-async-redis --enable-sockets --enable-mysqlnd && make clean && make && make install

ENTRYPOINT ["/home/init.sh"]


