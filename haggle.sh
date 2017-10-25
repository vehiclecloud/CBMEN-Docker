#!/bin/bash -ev

ifconfig eth0 broadcast 172.21.0.255
route add default eth0

su - ubuntu -c "/usr/local/bin/haggle  -I -dd -d -f -m"

tail -f /dev/null
