#!/bin/bash
#
# This bash script load all modules needed to build JEDI mpas-bundle release/3.0.0
#
# MODULEPATH=""

export spackroot=/lustre/projetos/satdas/opt
source ${spackroot}/spack/linux-sles15-zen4/gcc-13.3.0/lmod-8.7.37-6uohtfnul3kvi74dn5y2gj4dkj2hd77p/lmod/lmod/init/bash
module purge

module use /opt/cray/pe/modulefiles
module use /opt/cray/pe/craype-targets/default/modulefiles

# Sets compilers and point the serial modules :
#
module use /p/projetos/satdas/opt/linux/modulefiles/Core
module load stack-gcc/13.3.0

# Loads openmpi@5.0.5, sets MPI parallel compilers and points to libraries compiled with parallel
# 
module load stack-openmpi/5.0.5
## this is done by the above module load : module use /lustre/projetos/satdas/opt/linux/modulefiles/openmpi/5.0.5-sqrwvj2/gcc/13.3.0

module load gcc-native/13.2

module load git-lfs/3.5.1 git/2.43.0

# Deactivate anaconda
if command -v conda >/dev/null 2>&1; then
  conda deactivate
fi

# module load hwloc/2.11.1

module load libfabric
module load openmpi/5.0.5
module load eigen
module load openblas/0.3.24
module load atlas
module load eckit
module load fckit
module load ectrans
module load python/3.11.7
export PYTHONPATH=${python_ROOT}/lib/python3.11/encodings:${python_ROOT}/lib64/python3.11/lib-dynload

module load boost/1.84.0
module load qhull/2020.2
module load atlas
module load fftw
module load gptl
module load gsl-lite
module load hdf5
module load zstd/1.5.6
module load netcdf-c
module load netcdf-cxx4
module load netcdf-fortran
module load parallel-netcdf
module load parallelio/2.6.2
# module load boost # Module atlas already load boost
module load cmake/3.27.9
module load jedi-cmake
module load json-schema-validator/2.3.0 
module load json/3.11.3
module load ecbuild
module load eigen
## The user can add following by using 'conda install ...' if needed
# module load py-setuptools/63.4.3-7iqa2nh
#module load py-pycodestyle
#module load py-pybind11
#module load py-numpy/1.23.5
#module load py-pyyaml/6.0.2
#module load py-h5py/3.12.1
#module load py-netcdf4/1.5.8
#module load py-cdo/1.5.6
#module load py-matplotlib/3.7.4
#module load py-pyproj/3.6.0
#module load py-cartopy/0.24.1
# module load py-pyproj/3.6.0

module load proj/9.4.1
# leitura do modulo proj define PROJ_LIB
## export PROJ_LIB=${spackroot}/mpas-gcc-mpich/gcc/12.2.0/proj-9.4.1-23jhkfe/share/proj/
module load nco
module load odc/1.5.2
module load sqlite/3.46.0
module load udunits
module load nccmp

module list

ulimit -s unlimited
ulimit -v unlimited

export PIO_TYPENAME_VALID_VALUES=netcdf,netcdf4p,netcdf4c,pnetcdf;
export PIO_VERSION_MAJOR=2;

export F_UFMTENDIAN='big_endian:101-200'
export LD_LIBRARY_PATH=`pwd`/lib:$LD_LIBRARY_PATH
