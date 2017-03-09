#!/bin/sh


SRC="nwchem-6.3.revision2-src.2013-10-17"
ARCH="${SRC}.tar.gz"
LOG=$PWD/nwchem-make.log
SCRATCH=/scratch/nwchembuild
BUILD_OPTIONS="$PWD/build-nwchem.env"

echo "Extracting source archive"
cp $ARCH $SCRATCH
cd $SCRATCH
rm -Rf $SRC
tar xzf $ARCH
cd $SRC

# Set the build options
source $BUILD_OPTIONS

# BUILD
cd $NWCHEM_TOP/src
pwd
echo "running make nwchem_config"
make nwchem_config
echo "Running make 64_to_32"
make 64_to_32
echo "running make"
make -j >$LOG 2>&1

echo "Building version info"
cd $NWCHEM_TOP/src/util
make version
make
cd $NWCHEM_TOP/src
make link

echo "Done!"
