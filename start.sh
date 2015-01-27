#!/bin/bash

# Startup script for bind 9

/usr/sbin/service bind9 start

/usr/bin/tail -f /var/log/bind/bind.log