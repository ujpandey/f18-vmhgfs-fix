#!/bin/bash

# This script patches vmware tools for Fedora 18 to fix vmhgfs

if [[ ! -f vmware9.compat_mm.patch ]]
then
  wget -d https://raw.github.com/ujpandey/f18-vmhgfs-fix/master/vmware9.compat_mm.patch
fi

if [[ ! -f vmware_hgfs_fix.sh ]]
then
  wget -d https://raw.github.com/ujpandey/f18-vmhgfs-fix/master/vmware_hgfs_fix.sh
fi

if [[ ! -f patch_inode.c.patch ]]
then
  wget -d https://raw.github.com/ujpandey/f18-vmhgfs-fix/master/patch_inode.c.patch
fi

if [[ ! -f patch_inode.c.sh ]]
then
  wget -d https://raw.github.com/ujpandey/f18-vmhgfs-fix/master/patch_inode.c.sh
fi

chmod +x vmware_hgfs_fix.sh
chmod +x patch_inode.c.sh
./vmware_hgfs_fix.sh
./patch_inode.c.sh
echo | ./vmware-install.pl --clobber-kernel-modules=vmci

