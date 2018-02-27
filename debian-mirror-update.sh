#!/bin/bash
 
# sourcehost: choose a mirror in your proximity!
HOST=ftp.jp.debian.org
#HOST=opensource.nchc.org.tw
#HOST=deb.debian.org
 
# destination directory
DEST=/opt/repo-liuxl/repos/debian
 
# Debian version(s) to mirror
DIST=jessie,jessie-backports,jessie-updates,\
stretch,stretch-backports,stretch-updates

# Debian sections to mirror
SECTION=main,main/debian-installer,contrib,non-free
 
# architecture
ARCH=arm64

# extra
EXTRA=doc,tools


# installer
DI_DIST=jessie,stretch

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
 --progress --nosource \
 --proxy=http://192.168.1.108:8900
#"   --passive --cleanup -p \
# --progress --nosource \
 
 logger -t mirror[$$] finished updating Debian mirror
fi

cd /opt/repo-liuxl/repos/debian/dists/jessie/main/installer-arm64/current/images
wget http://ftp.jp.debian.org/debian/dists/jessie/main/installer-arm64/current/images/SHA256SUMS
cd /opt/repo-liuxl/repos/debian/dists/stretch/main/installer-arm64/current/images
wget http://ftp.jp.debian.org/debian/dists/stretch/main/installer-arm64/current/images/SHA256SUMS
cd /opt/repo-liuxl/repos/debian
rm -f extrafiles ; wget http://ftp.jp.debian.org/debian/extrafiles
mirror="http://ftp.jp.debian.org/debian/"
installer_src_version="20150422+deb8u4"
cd /opt/repo-liuxl/repos/debian/pool/main/d/debian-installer/
#rm -f debian-installer_${installer_src_version}.dsc debian-installer_${installer_src_version}.tar.gz
wget ${mirror}/pool/main/d/debian-installer/debian-installer_${installer_src_version}.dsc
wget ${mirror}/pool/main/d/debian-installer/debian-installer_${installer_src_version}.tar.gz
