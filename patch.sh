#!/bin/bash

# This script patches vmware tools for Fedora 18 to fix vmhgfs

import os, subprocess

if [ ! -f vmware9.compat_mm.patch ] && wget -d https://raw.github.com/ujpandey/patch_vmware_tools_Fedora_18/master/vmware9.compat_mm.patch
if [ ! -f vmware_hgfs_fix.sh ] && wget -d https://raw.github.com/ujpandey/patch_vmware_tools_Fedora_18/master/vmware_hgfs_fix.sh
if [ ! -f patch_inode.c.patch ] && wget -d https://raw.github.com/ujpandey/patch_vmware_tools_Fedora_18/master/patch_inode.c.patch
if [ ! -f patch_inode.c.sh ] && wget -d https://raw.github.com/ujpandey/patch_vmware_tools_Fedora_18/master/patch_inode.c.sh

chmod +x vmware_hgfs_fix.sh
chmod +x patch_inode.c.sh
./vmware_hgfs_fix.sh
./patch_inode.c.sh
./vmware-install.pl --clobber-kernel-modules=vmci
