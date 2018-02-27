#!/bin/bash
/usr/bin/rsync -avz --delete --exclude='repo*' \
--numeric-ids --delete-delay --delay-updates \
rsync://dl.fedoraproject.org/fedora-secondary/updates/26/aarch64/ \
/opt/repo-liuxl/repos/fedora/updates/26/aarch64/

/usr/bin/createrepo --update \
/opt/repo-liuxl/repos/fedora/updates/26/aarch64/


#rsync://dl.fedoraproject.org/pub/fedora-secondary/releases/23/Everything/aarch64/os/
#fedora-secondary/updates/23/aarch64/
