#!/bin/bash
#
# This bash script load all modules needed to build JEDI mpas-bundle release/3.0.0
#
MODULEPATH=""
source /mnt/beegfs/jose.aravequia/spack-install/linux-rhel8-zen2/gcc-12.2.0/lmod-8.7.24-qjojctlkijj4mu6im233p36e7k2rau6b/lmod/8.7.24/init/bash
module use /mnt/beegfs/jose.aravequia/ispack-1.9.2/spack/share/spack/lmod/linux-rhel8-x86_64/Core
module use /mnt/beegfs/jose.aravequia/spack-install/mpas-gcc-mpich/modulefiles/Core
module use /mnt/beegfs/jose.aravequia/spack-install/mpas-gcc-mpich/modulefiles/gcc/12.2.0

module purge
module load gcc/12.2.0
module load stack-gcc/12.2.0

module load hwloc/2.11.1

module load stack-mpich/4.2.3

module load libfabric
module load atlas
module load eckit
module load fckit
module load fftw
module load gptl
module load gsl-lite
module load hdf5
module load netcdf-c
module load netcdf-cxx4
module load netcdf-fortran
module load parallel-netcdf
module load parallelio/2.6.2
# module load boost # Module atlas already load boost
module load cmake
module load jedi-cmake
module load ecbuild
module load eigen
module load py-setuptools/63.4.3
module load py-pycodestyle
module load py-pybind11
module load py-numpy/1.23.5
module load py-pyyaml/6.0.2
module load py-h5py/3.12.1
module load py-netcdf4/1.5.8
module load py-cdo/1.5.6
module load py-matplotlib/3.7.4
module load nco/5.1.6
module load odc/1.5.2
module load sqlite
module load openblas
module load udunits
module load nccmp

module list

ulimit -s unlimited
ulimit -v unlimited

export PIO_TYPENAME_VALID_VALUES=netcdf,netcdf4p,netcdf4c,pnetcdf;
export PIO_VERSION_MAJOR=2;

export F_UFMTENDIAN='big_endian:101-200'
export LD_LIBRARY_PATH=`pwd`/lib:$LD_LIBRARY_PATH
