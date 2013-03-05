#!/bin/sh
CUR_DIR=`basename $PWD`.epub
if [ "$1" != "" ] ; then
  CUR_DIR=$1
fi

echo "create epub: $CUR_DIR"

zip -r foo . -i "/*"
mv foo.zip $CUR_DIR
ls -l $CUR_DIR
