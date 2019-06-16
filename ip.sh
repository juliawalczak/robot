#!/bin/bash
chmod 755 ip.sh
ip address |grep inet |grep global |grep dynamic |awk '{print$2}'|cut -d '/' -f1
