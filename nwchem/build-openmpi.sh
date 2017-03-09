#!/bin/bash

VER="1.4.5"
#DEST=/home/djennewe/Work/openmpi_$VER
#DEST=/share/apps/openmpi-$VER-gcc-int64
DEST=/share/apps/openmpi-$VER-gcc44-int64
ARCH=/home/djennewe/nwchem/openmpi-$VER.tar.bz2

#/bin/rm -Rf $DEST

cd $SCRATCH

rm -Rf openmpi-$VER
tar xjf $ARCH
cd openmpi-$VER

# works: 32-bit integer
#./configure --prefix=$DEST --with-sge && make -j4 && make install

./configure \
    CC=gcc44 \
	CXX=g++44 \
	FC=gfortran44 \
	F77=gfortran44 \
	CFLAGS=-m64 \
	CXXFLAGS=-m64 \
	FFLAGS="-m64 -fdefault-integer-8" \
	FCFLAGS="-m64 -fdefault-integer-8" \
	LIBS=-lpthread \
	--prefix=$DEST \
	--with-sge \
	&& make -j4
#	&& make -j4 && make install

