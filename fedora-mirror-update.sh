#!/bin/bash
/usr/bin/rsync -avz --delete --exclude='repo*' \
--numeric-ids --delete-delay --delay-updates \
rsync://dl.fedoraproject.org/fedora-secondary/releases/26/Everything/aarch64/os/ \
/opt/repo-liuxl/repos/fedora/releases/26/Everything/aarch64/os/

/usr/bin/createrepo --update \
/opt/repo-liuxl/repos/fedora/releases/26/Everything/aarch64/os/


#rsync://dl.fedoraproject.org/pub/fedora-secondary/releases/23/Everything/aarch64/os/
#fedora-secondary/updates/23/aarch64/
