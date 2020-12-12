# Firmware generator for sprtch printer interface

## Requirements

To correctly set the `wpa_supplicant` WiFi passwords for the target build you
need to have `pass` configured with four different password:

* `sprtch_home_ssid`
* `sprtch_home_pass`
* `sprtch_sprtch_ssid`
* `sprtch_sprtch_pass`

## Generate firmware image for RPI

To generate the RPI firmware you should use the buildroot variable stored in
the `sprtch_defconfig` file.

```bash
git submodule init
git submodule update
cd buildroot
make BR2_EXTERNAL=../ sprtch_defconfig
```

## On package update

When one of the custom package I use has to be updated the first step is to
update the `<pkg_name>_VERSION` in  `/package/<pkg_name>/<pkg_name>.mk` file
with the latest commit reference.

The second step is to rebuild the package that has to be updated.

```bash
cd buildroot
rm dl/<pkg_name>
rm output/build/<pkg_name>-<commit> -rf
```

## Create a new package

To create a new package to add to the target you first need to create a new
folder in `/package/<name>` containing the following files:

* `Config.in`
* `<name>.mk`

Refer to the documentation depending on the type of package you want to build.
Once the package is correctly defined add a reference to this new package in
the `/Config.in` file.

```bash
echo "source \"$BR2_EXTERNAL_sprtch_PATH/package/despinassy/Config.in\"" >> ./Config.in
```

Tick this new package in the `make menuconfig` and then export this new version
with `make savedefconfig`
