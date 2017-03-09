#!/bin/bash


BASE_URL="http://ftp.jaist.ac.jp/pub/OpenBSD/OpenSSH/portable"
# http://ftp.jaist.ac.jp/pub/OpenBSD/OpenSSH/portable/openssh-6.6p1.tar.gz
# http://ftp.jaist.ac.jp/pub/OpenBSD/OpenSSH/portable/openssh-7.4p1.tar.gz

#VER="openssh-7.4p1"
VER="openssh-6.6p1"

SRC_URL="$BASE_URL/$VER.tar.gz"

rm -Rf ./build && mkdir -p build && cd build

wget $SRC_URL

tar xzf $VER.tar.gz

cd $VER
rm -rf contrib/aix/ contrib/hpux/ contrib/suse/ contrib/caldera/  contrib/solaris/ contrib/cygwin/
sed -i 's/no_x11_askpass 0/no_x11_askpass 1/g' contrib/redhat/openssh.spec
sed -i 's/no_gnome_askpass 0/no_gnome_askpass 1/g' contrib/redhat/openssh.spec
sed -i 's/TODO WARNING\*/TODO/g' contrib/redhat/openssh.spec
cd ..

rm -f $VER.tar.gz
tar -czf $VER.tar.gz $VER/
rpmbuild -tb --clean $VER.tar.gz

