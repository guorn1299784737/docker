##安装拓展 
官方提供的 docker-php-ext-* 脚本接受任意的绝对路径.  
这里主要用到的是官方提供的 docker-php-ext-configure 和  
docker-php-ext-install 快捷脚本.
具体示例请看Dockerfile 
### 相关命令
解压源码 cd /usr/src; docker-php-source extract;
删除源码  docker-php-source delete;
## 相关信息
源码目录: /usr/src
脚本目录: /usr/local/bin/
##安装xdebug
####安装拓展
    RUN pecl install xdebug && docker-php-ext-enable xdebug
####添加配置，如下
    [xdebug]
    xdebug.remote_host = "phpstorm.mydev.com"  
    xdebug.default_enable = 1
    xdebug.remote_autostart = 1
    xdebug.remote_connect_back = 0
    xdebug.remote_enable = 1
    xdebug.remote_handler = "dbgp"
    xdebug.remote_port = 9009
    xdebug.idekey = "PHPSTORM"

####host中配置
真机和虚拟机都要配置域名映射，如真机配置域名如下  
配置127.0.0.1 phpstorm.mydev.com

##php质量检查工具
wget https://github.com/squizlabs/PHP_CodeSniffer/releases/download/3.4.1/phpcs.phar