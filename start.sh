#!/bin/bash

# Startup script for bind 9

/usr/sbin/service bind9 start

sleep 5

/usr/bin/tail -f /var/log/bind/bind.log