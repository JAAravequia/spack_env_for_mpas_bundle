# spack_env_for_mpas_bundle
Spack Environment to mpas-bundle at INPE's JACI supercomputer 

The library environment was built with spack-stack (https://github.com/jcsda/spack-stack.git) .

This was tested with JEDI mpas-bundle https://github.com/JCSDA/mpas-bundle.git release/3.0.0

Note: The spack-stack library for mpas-bundle at JACI was built with openmpi-5 library.
      JEDI applications compiled with openmpi-5 library **were not tested yet** on multiple nodes at JACI. 

### Before compiling mpas-bundle with JEDI-MPAS libraries, run the prep_jaci.sh script to install a few python functions needed to run ctest :

```
git clone -b jaci-v1.0.0 https://github.com/JAAravequia/spack_env_for_mpas_bundle.git
source ./spack_env_for_mpas_bundle/prep_jaci.sh
```

### You don't need to checkout all the JEDI mpas-bundle repository. You can copy it using: 

```
cp -r /lustre/projetos/satdas/mpas-bundle .
```
### But, if you prefer to get the code from git, please be sure that git-lfs is accessible in your account, them go ahead with
```
git clone -b release/3.0.0 --recursive https://github.com/JCSDA/mpas-bundle.git
```

###  Now, you need to load the libraries environment:
```
source ./spack_env_for_mpas_bundle/gcc13.3-openmpi.sh
````

### Prepare to build the code with ecbuild as below:

```
mkdir build-jedi && cd build-jedi
export JEDI_BUILD=`pwd`
ecbuild ../mpas-bundle
```
If ecbuild went well you will see at the end something like below:
``` 
...
-- Configuring done (129.7s)
-- Generating done (8.8s)
-- Build files have been written to: /your/path/build-jedi
```

### Now, compile the code

``` 
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
