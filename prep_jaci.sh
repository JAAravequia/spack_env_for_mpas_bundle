#!/bin/bash
#
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

# Deactivate anaconda
if command -v conda >/dev/null 2>&1; then
  conda deactivate
fi

module load python/3.11.7
export PYTHONPATH=${python_ROOT}/lib/python3.11/encodings:${python_ROOT}/lib64/python3.11/lib-dynload

## install using pip all python libraries needed by ctest (see errors log if any test fails) and others users needs
${python_ROOT}/bin/python3 -m pip install --user pyyaml 
${python_ROOT}/bin/python3 -m pip install --user netCDF4
# add more as needed

