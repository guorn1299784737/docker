#!/bin/bash

(php-fpm &);
/usr/sbin/sshd -D -e;