# Firmware generator for sprtch printer interface

## Generate firmware image for RPI

To generate the RPI firmware you should use the buildroot variable stored in
the `sprtch_defconfig` file.

```
$ git submodule init
$ git submodule update
$ cd buildroot
$ make BR2_EXTERNAL=../ sprtch_defconfig
```

## On package update

When one of the custom package I use has to be updated the first step is to
update the `<pkg_name>_VERSION` in  `/package/<pkg_name>/<pkg_name>.mk` file
with the latest commit reference.

The second step is to rebuild the package that has to be updated.

```
$ cd buildroot
$ rm dl/<pkg_name>
$ rm output/build/<pkg_name>-<commit> -rf
```
