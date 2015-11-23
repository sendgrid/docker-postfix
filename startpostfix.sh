#!/bin/bash -e


service rsyslog start
service postfix start

# comment the lines below out for debugging (using bash prompt in container)
while true
do
    sleep 1
done