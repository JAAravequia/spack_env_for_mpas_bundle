# spack_env_for_mpas_bundle
Spack Environment to mpas-bundle at INPE's EGEON computer cluster

The library environment was built with spack-stack (https://github.com/jcsda/spack-stack.git) .

This was tested with JEDI mpas-bundle https://github.com/JCSDA/mpas-bundle.git release/3.0.0

### To get the JEDI mpas-bundle: 

```
cd /mnt/beegfs/$USER
git clone -b release/3.0.0 --recursive https://github.com/JCSDA/mpas-bundle.git
```

### To build the code:

```
cd /mnt/beegfs/$USER
git clone https://github.com/JAAravequia/spack_env_for_mpas_bundle.git
source ./spack_env_for_mpas_bundle/gnu-egeon.sh
mkdir build-jedi && cd build-jedi
ecbuild /mnt/beegfs/$USER/mpas-bundle
make -j8
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
