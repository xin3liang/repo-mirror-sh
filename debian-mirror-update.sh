#!/bin/bash
 
# sourcehost: choose a mirror in your proximity!
HOST=ftp.hk.debian.org
 
# destination directory
DEST=/opt/repo-liuxl/repos/debian
 
# Debian version(s) to mirror
DIST=jessie,jessie-backports,jessie-updates #,\
#stretch,stretch-backports,stretch-updates

# Debian sections to mirror
SECTION=main,main/debian-installer,contrib,non-free
 
# architecture
ARCH=arm64

# extra
EXTRA=doc,tools


# installer
DI_DIST=jessie

# -----------------------------------------
# check whether we're online:
 
ping $HOST -c 4 -i 3 >/dev/null 2>&1
 
if [ "$?" -eq 0 ]; then
 # yes, we're online :-)
 logger -t mirror[$$] updating Debian mirror
 
 #sudo su mirror -c \
# "
debmirror ${DEST} \
 --method=http \
 --host=${HOST} \
 --root=/debian \
 --dist=${DIST} \
 --section=${SECTION} \
 --arch=${ARCH} \
 --rsync-extra=${EXTRA} \
 --di-dist=${DI_DIST} \
 --slow-cpu $VERBOSE \
 --progress
#"   --passive --cleanup -p \
 
 logger -t mirror[$$] finished updating Debian mirror
fi

cd /opt/repo-liuxl/repos/debian/dists/jessie/main/installer-arm64/current/images
wget http://ftp.hk.debian.org/debian/dists/jessie/main/installer-arm64/current/images/SHA256SUMS
