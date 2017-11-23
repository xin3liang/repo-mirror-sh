#!/bin/bash
#/usr/bin/rsync -avz --delete --exclude='repo*' --exclude='*Everything.iso.sum' \
/usr/bin/rsync -avz --delete --exclude='*Everything.iso.sum' \
rsync://rsync.osuosl.org/centos-altarch/7/isos/aarch64/ \
/opt/repo-liuxl/repos/centos/7/isos/aarch64

pushd /opt/repo-liuxl/repos/centos/7/isos/aarch64
cat md5sum.txt |grep Everything > CentOS-7-aarch64-Everything.iso.sum
popd

#/usr/bin/createrepo --update \
#/opt/repo-liuxl/repos/centos/7/isos/aarch64

