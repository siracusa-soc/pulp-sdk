# SDK setup

This version of SDK uses [`camera` model](https://github.com/siracusa-soc/gvsoc-pulp.git).

## Getting started

These instructions were developed using a fresh Ubuntu 18.04 Bionic Beaver 64-Bit.

The following packages needed to be installed:

~~~~~shell
sudo apt-get install -y build-essential git libftdi-dev libftdi1 doxygen python3-pip libsdl2-dev curl cmake libusb-1.0-0-dev scons gtkwave libsndfile1-dev rsync autoconf automake texinfo libtool pkg-config libsdl2-ttf-dev
~~~~~

The SDK also requires the `argcomplete` and `pyelftools` Python package. You can install them for the local user with:
~~~~~shell
pip install --user argcomplete pyelftools
~~~~~
Omit `--user` to install at system level instead, which will probably require admin rights.

This version requires PULP toolchain to compile the application exploiting pulp features. PULP toolchain is available at: https://github.com/pulp-platform/pulp-riscv-gnu-toolchain

You can choose also its precompiled version, exploring: https://github.com/pulp-platform/pulp-riscv-gnu-toolchain/releases/tag/v1.0.16

Please, refer to the corresponding README for the installation.

Once PULP toolchain is correctly installed, define the path in which there is toolchain bin folder:

~~~~~shell
export PULP_RISCV_GCC_TOOLCHAIN=<INSTALL_DIR>
~~~~~

Source the file corresponding to the desired configuration:

~~~~~shell
cd pulp-sdk
source configs/siracusa.sh
~~~~~
The tool is tested with GCC 11.3.0 and CMAKE 3.22.1. If the default one is not correct, CC and CXX can be set to
point to a correct one. To check if gcc has the right version:

~~~~~shell
gcc --version
~~~~~

Please, refer to official guide to update gcc if is needed.

## SDK build

Compile the SDK with this command:

~~~~~shell
make all
~~~~~

## GVSOC Test execution

For basic helloworld test, go to a test/hello and execute:

~~~~~shell
make clean all run platform=gvsoc
~~~~~

For basic camera connectivity test go to tests/camera/connectivity

~~~~~shell
make clean all run platform=gvsoc
~~~~~
