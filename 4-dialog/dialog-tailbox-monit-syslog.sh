#!/bin/bash

tail -f /var/log/syslog > /tmp/log & \
dialog --title "MonitDSyslog" \
	--tailbox /tmp/log 25 100
