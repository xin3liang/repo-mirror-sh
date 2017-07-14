#!/bin/bash
 
# sourcehost: choose a mirror in your proximity!
HOST=ftp.hk.debian.org
 
# destination directory
DEST=/opt/repo-liuxl/repos/debian
 
# Debian version(s) to mirror
DIST=jessie,jessie-backports,jessie-updates #,\
#stretch,stretch-backports,stretch-updates
 
# architecture
ARCH=arm64
 
# -----------------------------------------
# check whether we're online:
 
ping $HOST -c 4 -i 3 >/dev/null 2>&1
 
if [ "$?" -eq 0 ]; then
 # yes, we're online :-)
 logger -t mirror[$$] updating Debian mirror
 
 #sudo su mirror -c \
# "
debmirror ${DEST} \
 --method=rsync \
 --nosource \
 --host=${HOST} \
 --root=/debian \
 --dist=${DIST} \
 --section=main \
 --arch=${ARCH} \
 --passive --cleanup -p \
 --slow-cpu $VERBOSE
#" 
 
 logger -t mirror[$$] finished updating Debian mirror
fi
