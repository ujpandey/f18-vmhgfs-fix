#!/bin/bash

PATCH_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

pushd lib/modules/source
if [[ ! -f vmhgfs.tar.orig.1 ]]
then
  cp vmhgfs.tar vmhgfs.tar.orig.1
fi
rm -rf vmhgfs-only
tar xf vmhgfs.tar
pushd vmhgfs-only
patch -p1 < $PATCH_DIR/patch_inode.patch
popd
tar cf vmhgfs.tar vmhgfs-only
rm -rf vmhgfs-only
popd

