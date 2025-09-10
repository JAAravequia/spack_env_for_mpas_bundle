# spack_env_for_mpas_bundle
Spack Environment to mpas-bundle at INPE's EGEON computer cluster

The library environment was built with spack-stack (https://github.com/jcsda/spack-stack.git) .

This was tested with JEDI mpas-bundle https://github.com/JCSDA/mpas-bundle.git release/3.0.0

Note: The spack-stack library for mpas-bundle was rebuilt with mpich library, 
because the JEDI applications compiled with openmpi-5 library didn't run as expected on multiple nodes. 

### Before downloading the JEDI-MPAS code, be sure that the git-lfs is configured:

Verify if you already have git-lfs:

```
git lfs version
```

If the ansewer is something like:

```
git: 'lfs' is not a git command. See 'git --help'.
```

you need to configure **lfs** in your account with :

```
git lfs install --skip-repo
``` 

Make sure that the location where **git-lfs** is installed is in your PATH environment: 

```
echo $PATH
```

### To get the JEDI mpas-bundle: 

```
cd /mnt/beegfs/$USER
git clone -b release/3.0.0 --recursive https://github.com/JCSDA/mpas-bundle.git
```

### To build the code:

```
cd /mnt/beegfs/$USER
git clone https://github.com/JAAravequia/spack_env_for_mpas_bundle.git
mkdir build-jedi && cd build-jedi
export JEDI_BUILD=`pwd`
source ../spack_env_for_mpas_bundle/gnu-mpich-egeon.sh
ecbuild /mnt/beegfs/$USER/mpas-bundle
make -j8
export LD_LIBRARY_PATH=${JEDI_BUILD}/lib:${LD_LIBRARY_PATH}
```

If the compilation ends without any error, several executables files will be created in bin directory.

### To test all JEDI apps, you can run:

```
ctest
```
### To run only MPAS related tests use:
```
cd mpas-jedi
ctest
```
