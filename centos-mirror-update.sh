#!/bin/bash
/usr/bin/rsync -avz --delete --exclude='repo*' \
rsync://rsync.osuosl.org/centos-altarch/7/os/aarch64/ \
/opt/repo-liuxl/repos/centos/7/os/aarch64

/usr/bin/createrepo --update \
/opt/repo-liuxl/repos/centos/7/os/aarch64

