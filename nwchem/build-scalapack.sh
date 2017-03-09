#!/bin/bash

VER="2.0.2"
#VER="1.8.0"
SRC=scalapack-$VER
ARCH=$SRC.tgz

source /share/apps/openmpi-1.4.5-gcc44-int64/openmpi.sh 

rm -Rf $SRC
tar -xzf $ARCH
cd $SRC

cp SLmake.inc.example SLmake.inc
cat >>SLmake.inc <<EOF
ACML="/share/apps/acml4.4.0/gfortran64/lib"
LIBS          = -L\$(ACML) -lacml -Wl,-rpath=\$(ACML)
EOF

make

echo "done!"
