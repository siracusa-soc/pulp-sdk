# the MAGICK_ROOT variable can be used to pass an alternative installation
# prefix for the GraphicsMagick library. 
ifdef MAGICK_ROOT
export MAGICK_ROOT := $(realpath $(MAGICK_ROOT))
endif

SHELL=bash

ifndef PULP_SDK_HOME
    $(error Please source the proper configuration first)
endif

BUILD_DIR ?= $(CURDIR)/build

export BUILD_DIR

include rules/json-tools.mk
include rules/gap-configs.mk
include rules/pulp-debug-bridge.mk
include rules/pulpos.mk

CMAKE_FLAGS ?= -j 6
CMAKE ?= cmake


S ?= 0
ET ?= 100
RT ?= 2
AT ?= 0
AD ?= 64
IET ?= 0
B ?= 0x10310000

# A0L ?= 2
# A1L ?= 2
# A2L ?= 2
# R0L ?= 2
# R1L ?= 2
# R2L ?= 2
# F0L ?= 2
# F1L ?= 2
# F2L ?= 2
# A0S ?= 64
# A1S ?= 128
# A2S ?= 256
# R0S ?= 512
# R1S ?= 1024
# R2S ?= 2048
# F0S ?= 4096
# F1S ?= 8192
# F2S ?= 16384

S_A0L=8
S_A1L=20
S_A2L=240
S_R0L=1
S_R1L=1
S_R2L=1
S_F0L=2
S_F1L=2
S_F2L=1
S_A0S=4
S_A1S=32
S_A2S=640
S_R0S=0
S_R1S=0
S_R2S=0
S_F0S=0x04000000
S_F1S=640*240
S_F2S=0
S_AD=32

I_A0L=8
I_A1L=20
I_A2L=240
I_R0L=1
I_R1L=1
I_R2L=1
I_F0L=2
I_F1L=2
I_F2L=1
I_A0S=4
I_A1S=32
I_A2S=640
I_R0S=0
I_R1S=0
I_R2S=0
I_F0S=0x04000000
I_F1S=640*240
I_F2S=0
I_AD=64


build:
	$(CMAKE) -S . -B build -DCMAKE_BUILD_TYPE=RelWithDebInfo \
		-DGVSOC_MODULES="$(GVSOC_MODULES)" \
		-DGVSOC_TARGETS=${GVSOC_TARGETS} \
		-DCMAKE_INSTALL_PREFIX=$(PULP_SDK_HOME)/install/workstation
	$(CMAKE) --build build $(CMAKE_FLAGS)
	$(CMAKE) --install build


clean:
	rm -rf build install

checkout:
	git submodule update --recursive --init





gvsoc_sensor_sim: build
	cd /scratch/prasadar/siracusa/camera/pulp-sdk/tests/sensor/smem_access && make S=$(S) ET=$(ET) RT=$(RT) AT=$(AT) S_AD=$(S_AD) I_AD=$(I_AD) B=$(B) S_F0L=$(S_F0L) S_F1L=$(S_F1L) S_F2L=$(S_F2L) S_R0L=$(S_R0L) S_R1L=$(S_R1L) S_R2L=$(S_R2L) S_A0L=$(S_A0L) S_A1L=$(S_A1L) S_A2L=$(S_A2L) S_F0S=$(S_F0S) S_F1S=$(S_F1S) S_F2S=$(S_F2S) S_R0S=$(S_R0S) S_R1S=$(S_R1S) S_R2S=$(S_R2S) S_A0S=$(S_A0S) S_A1S=$(S_A1S) S_A2S=$(S_A2S) I_F0L=$(I_F0L) I_F1L=$(I_F1L) I_F2L=$(I_F2L) I_R0L=$(I_R0L) I_R1L=$(I_R1L) I_R2L=$(I_R2L) I_A0L=$(I_A0L) I_A1L=$(I_A1L) I_A2L=$(I_A2L) I_F0S=$(I_F0S) I_F1S=$(I_F1S) I_F2S=$(I_F2S) I_R0S=$(I_R0S) I_R1S=$(I_R1S) I_R2S=$(I_R2S) I_A0S=$(I_A0S) I_A1S=$(I_A1S) I_A2S=$(I_A2S) clean all run platform=gvsoc

gvsoc_sensor_sim_trace: build
	cd /scratch/prasadar/siracusa/camera/pulp-sdk/tests/sensor/smem_access && make S=$(S) ET=$(ET) RT=$(RT) AT=$(AT) S_AD=$(S_AD) I_AD=$(I_AD) B=$(B) S_F0L=$(S_F0L) S_F1L=$(S_F1L) S_F2L=$(S_F2L) S_R0L=$(S_R0L) S_R1L=$(S_R1L) S_R2L=$(S_R2L) S_A0L=$(S_A0L) S_A1L=$(S_A1L) S_A2L=$(S_A2L) S_F0S=$(S_F0S) S_F1S=$(S_F1S) S_F2S=$(S_F2S) S_R0S=$(S_R0S) S_R1S=$(S_R1S) S_R2S=$(S_R2S) S_A0S=$(S_A0S) S_A1S=$(S_A1S) S_A2S=$(S_A2S) I_F0L=$(I_F0L) I_F1L=$(I_F1L) I_F2L=$(I_F2L) I_R0L=$(I_R0L) I_R1L=$(I_R1L) I_R2L=$(I_R2L) I_A0L=$(I_A0L) I_A1L=$(I_A1L) I_A2L=$(I_A2L) I_F0S=$(I_F0S) I_F1S=$(I_F1S) I_F2S=$(I_F2S) I_R0S=$(I_R0S) I_R1S=$(I_R1S) I_R2S=$(I_R2S) I_A0S=$(I_A0S) I_A1S=$(I_A1S) I_A2S=$(I_A2S) clean all run platform=gvsoc runner_args="--trace=sensor/trace"

gvsoc_sensor_sim_trace_file: build
	cd /scratch/prasadar/siracusa/camera/pulp-sdk/tests/sensor/smem_access && make S=$(S) ET=$(ET) RT=$(RT) AT=$(AT) S_AD=$(S_AD) I_AD=$(I_AD) B=$(B) S_F0L=$(S_F0L) S_F1L=$(S_F1L) S_F2L=$(S_F2L) S_R0L=$(S_R0L) S_R1L=$(S_R1L) S_R2L=$(S_R2L) S_A0L=$(S_A0L) S_A1L=$(S_A1L) S_A2L=$(S_A2L) S_F0S=$(S_F0S) S_F1S=$(S_F1S) S_F2S=$(S_F2S) S_R0S=$(S_R0S) S_R1S=$(S_R1S) S_R2S=$(S_R2S) S_A0S=$(S_A0S) S_A1S=$(S_A1S) S_A2S=$(S_A2S) I_F0L=$(I_F0L) I_F1L=$(I_F1L) I_F2L=$(I_F2L) I_R0L=$(I_R0L) I_R1L=$(I_R1L) I_R2L=$(I_R2L) I_A0L=$(I_A0L) I_A1L=$(I_A1L) I_A2L=$(I_A2L) I_F0S=$(I_F0S) I_F1S=$(I_F1S) I_F2S=$(I_F2S) I_R0S=$(I_R0S) I_R1S=$(I_R1S) I_R2S=$(I_R2S) I_A0S=$(I_A0S) I_A1S=$(I_A1S) I_A2S=$(I_A2S) clean all run platform=gvsoc runner_args="--trace=sensor:log.txt"

gvsoc_sensor_sim_trace_smem: build
	cd /scratch/prasadar/siracusa/camera/pulp-sdk/tests/sensor/smem_access && make S=$(S) ET=$(ET) RT=$(RT) AT=$(AT) S_AD=$(S_AD) I_AD=$(I_AD) B=$(B) S_F0L=$(S_F0L) S_F1L=$(S_F1L) S_F2L=$(S_F2L) S_R0L=$(S_R0L) S_R1L=$(S_R1L) S_R2L=$(S_R2L) S_A0L=$(S_A0L) S_A1L=$(S_A1L) S_A2L=$(S_A2L) S_F0S=$(S_F0S) S_F1S=$(S_F1S) S_F2S=$(S_F2S) S_R0S=$(S_R0S) S_R1S=$(S_R1S) S_R2S=$(S_R2S) S_A0S=$(S_A0S) S_A1S=$(S_A1S) S_A2S=$(S_A2S) I_F0L=$(I_F0L) I_F1L=$(I_F1L) I_F2L=$(I_F2L) I_R0L=$(I_R0L) I_R1L=$(I_R1L) I_R2L=$(I_R2L) I_A0L=$(I_A0L) I_A1L=$(I_A1L) I_A2L=$(I_A2L) I_F0S=$(I_F0S) I_F1S=$(I_F1S) I_F2S=$(I_F2S) I_R0S=$(I_R0S) I_R1S=$(I_R1S) I_R2S=$(I_R2S) I_A0S=$(I_A0S) I_A1S=$(I_A1S) I_A2S=$(I_A2S) clean all run platform=gvsoc runner_args="--trace=smem --trace=sensor"

gvsoc_sensor_sim_trace_smem_file: build
	cd /scratch/prasadar/siracusa/camera/pulp-sdk/tests/sensor/smem_access && make S=$(S) ET=$(ET) RT=$(RT) AT=$(AT) S_AD=$(S_AD) I_AD=$(I_AD) B=$(B) S_F0L=$(S_F0L) S_F1L=$(S_F1L) S_F2L=$(S_F2L) S_R0L=$(S_R0L) S_R1L=$(S_R1L) S_R2L=$(S_R2L) S_A0L=$(S_A0L) S_A1L=$(S_A1L) S_A2L=$(S_A2L) S_F0S=$(S_F0S) S_F1S=$(S_F1S) S_F2S=$(S_F2S) S_R0S=$(S_R0S) S_R1S=$(S_R1S) S_R2S=$(S_R2S) S_A0S=$(S_A0S) S_A1S=$(S_A1S) S_A2S=$(S_A2S) I_F0L=$(I_F0L) I_F1L=$(I_F1L) I_F2L=$(I_F2L) I_R0L=$(I_R0L) I_R1L=$(I_R1L) I_R2L=$(I_R2L) I_A0L=$(I_A0L) I_A1L=$(I_A1L) I_A2L=$(I_A2L) I_F0S=$(I_F0S) I_F1S=$(I_F1S) I_F2S=$(I_F2S) I_R0S=$(I_R0S) I_R1S=$(I_R1S) I_R2S=$(I_R2S) I_A0S=$(I_A0S) I_A1S=$(I_A1S) I_A2S=$(I_A2S) clean all run platform=gvsoc runner_args="--trace=smem:smem.txt --trace=sensor:sensor.txt"

gvsoc_sensor_sim_trace_all_file: build
	cd /scratch/prasadar/siracusa/camera/pulp-sdk/tests/sensor/smem_access && make S=$(S) ET=$(ET) RT=$(RT) AT=$(AT) S_AD=$(S_AD) I_AD=$(I_AD) B=$(B) S_F0L=$(S_F0L) S_F1L=$(S_F1L) S_F2L=$(S_F2L) S_R0L=$(S_R0L) S_R1L=$(S_R1L) S_R2L=$(S_R2L) S_A0L=$(S_A0L) S_A1L=$(S_A1L) S_A2L=$(S_A2L) S_F0S=$(S_F0S) S_F1S=$(S_F1S) S_F2S=$(S_F2S) S_R0S=$(S_R0S) S_R1S=$(S_R1S) S_R2S=$(S_R2S) S_A0S=$(S_A0S) S_A1S=$(S_A1S) S_A2S=$(S_A2S) I_F0L=$(I_F0L) I_F1L=$(I_F1L) I_F2L=$(I_F2L) I_R0L=$(I_R0L) I_R1L=$(I_R1L) I_R2L=$(I_R2L) I_A0L=$(I_A0L) I_A1L=$(I_A1L) I_A2L=$(I_A2L) I_F0S=$(I_F0S) I_F1S=$(I_F1S) I_F2S=$(I_F2S) I_R0S=$(I_R0S) I_R1S=$(I_R1S) I_R2S=$(I_R2S) I_A0S=$(I_A0S) I_A1S=$(I_A1S) I_A2S=$(I_A2S) clean all run platform=gvsoc runner_args="--trace=.*:all.txt"

gvsoc_sensor_sim_trace_all: build
	cd /scratch/prasadar/siracusa/camera/pulp-sdk/tests/sensor/smem_access && make S=$(S) ET=$(ET) RT=$(RT) AT=$(AT) S_AD=$(S_AD) I_AD=$(I_AD) B=$(B) S_F0L=$(S_F0L) S_F1L=$(S_F1L) S_F2L=$(S_F2L) S_R0L=$(S_R0L) S_R1L=$(S_R1L) S_R2L=$(S_R2L) S_A0L=$(S_A0L) S_A1L=$(S_A1L) S_A2L=$(S_A2L) S_F0S=$(S_F0S) S_F1S=$(S_F1S) S_F2S=$(S_F2S) S_R0S=$(S_R0S) S_R1S=$(S_R1S) S_R2S=$(S_R2S) S_A0S=$(S_A0S) S_A1S=$(S_A1S) S_A2S=$(S_A2S) I_F0L=$(I_F0L) I_F1L=$(I_F1L) I_F2L=$(I_F2L) I_R0L=$(I_R0L) I_R1L=$(I_R1L) I_R2L=$(I_R2L) I_A0L=$(I_A0L) I_A1L=$(I_A1L) I_A2L=$(I_A2L) I_F0S=$(I_F0S) I_F1S=$(I_F1S) I_F2S=$(I_F2S) I_R0S=$(I_R0S) I_R1S=$(I_R1S) I_R2S=$(I_R2S) I_A0S=$(I_A0S) I_A1S=$(I_A1S) I_A2S=$(I_A2S) clean all run platform=gvsoc runner_args="--trace=.*"

gvsoc_sensor_sim_args: build
	cd /scratch/prasadar/siracusa/camera/pulp-sdk/tests/sensor/smem_access && make S=$(S) ET=$(ET) RT=$(RT) AT=$(AT) S_AD=$(S_AD) I_AD=$(I_AD) B=$(B) S_F0L=$(S_F0L) S_F1L=$(S_F1L) S_F2L=$(S_F2L) S_R0L=$(S_R0L) S_R1L=$(S_R1L) S_R2L=$(S_R2L) S_A0L=$(S_A0L) S_A1L=$(S_A1L) S_A2L=$(S_A2L) S_F0S=$(S_F0S) S_F1S=$(S_F1S) S_F2S=$(S_F2S) S_R0S=$(S_R0S) S_R1S=$(S_R1S) S_R2S=$(S_R2S) S_A0S=$(S_A0S) S_A1S=$(S_A1S) S_A2S=$(S_A2S) I_F0L=$(I_F0L) I_F1L=$(I_F1L) I_F2L=$(I_F2L) I_R0L=$(I_R0L) I_R1L=$(I_R1L) I_R2L=$(I_R2L) I_A0L=$(I_A0L) I_A1L=$(I_A1L) I_A2L=$(I_A2L) I_F0S=$(I_F0S) I_F1S=$(I_F1S) I_F2S=$(I_F2S) I_R0S=$(I_R0S) I_R1S=$(I_R1S) I_R2S=$(I_R2S) I_A0S=$(I_A0S) I_A1S=$(I_A1S) I_A2S=$(I_A2S) clean all run platform=gvsoc runner_args=$(ARGS)


gvsoc_isp_sim: build
	cd /scratch/prasadar/siracusa/camera/pulp-sdk/tests/isp/smem_access && make S=$(S) ET=$(ET) RT=$(RT) AT=$(AT) S_AD=$(S_AD) I_AD=$(I_AD) B=$(B) S_F0L=$(S_F0L) S_F1L=$(S_F1L) S_F2L=$(S_F2L) S_R0L=$(S_R0L) S_R1L=$(S_R1L) S_R2L=$(S_R2L) S_A0L=$(S_A0L) S_A1L=$(S_A1L) S_A2L=$(S_A2L) S_F0S=$(S_F0S) S_F1S=$(S_F1S) S_F2S=$(S_F2S) S_R0S=$(S_R0S) S_R1S=$(S_R1S) S_R2S=$(S_R2S) S_A0S=$(S_A0S) S_A1S=$(S_A1S) S_A2S=$(S_A2S) I_F0L=$(I_F0L) I_F1L=$(I_F1L) I_F2L=$(I_F2L) I_R0L=$(I_R0L) I_R1L=$(I_R1L) I_R2L=$(I_R2L) I_A0L=$(I_A0L) I_A1L=$(I_A1L) I_A2L=$(I_A2L) I_F0S=$(I_F0S) I_F1S=$(I_F1S) I_F2S=$(I_F2S) I_R0S=$(I_R0S) I_R1S=$(I_R1S) I_R2S=$(I_R2S) I_A0S=$(I_A0S) I_A1S=$(I_A1S) I_A2S=$(I_A2S) clean all run platform=gvsoc

gvsoc_isp_sim_trace: build
	cd /scratch/prasadar/siracusa/camera/pulp-sdk/tests/isp/smem_access && make S=$(S) ET=$(ET) RT=$(RT) AT=$(AT) S_AD=$(S_AD) I_AD=$(I_AD) B=$(B) S_F0L=$(S_F0L) S_F1L=$(S_F1L) S_F2L=$(S_F2L) S_R0L=$(S_R0L) S_R1L=$(S_R1L) S_R2L=$(S_R2L) S_A0L=$(S_A0L) S_A1L=$(S_A1L) S_A2L=$(S_A2L) S_F0S=$(S_F0S) S_F1S=$(S_F1S) S_F2S=$(S_F2S) S_R0S=$(S_R0S) S_R1S=$(S_R1S) S_R2S=$(S_R2S) S_A0S=$(S_A0S) S_A1S=$(S_A1S) S_A2S=$(S_A2S) I_F0L=$(I_F0L) I_F1L=$(I_F1L) I_F2L=$(I_F2L) I_R0L=$(I_R0L) I_R1L=$(I_R1L) I_R2L=$(I_R2L) I_A0L=$(I_A0L) I_A1L=$(I_A1L) I_A2L=$(I_A2L) I_F0S=$(I_F0S) I_F1S=$(I_F1S) I_F2S=$(I_F2S) I_R0S=$(I_R0S) I_R1S=$(I_R1S) I_R2S=$(I_R2S) I_A0S=$(I_A0S) I_A1S=$(I_A1S) I_A2S=$(I_A2S) clean all run platform=gvsoc runner_args="--trace=isp/trace"

gvsoc_isp_sim_trace_file: build
	cd /scratch/prasadar/siracusa/camera/pulp-sdk/tests/isp/smem_access && make S=$(S) ET=$(ET) RT=$(RT) AT=$(AT) S_AD=$(S_AD) I_AD=$(I_AD) B=$(B) S_F0L=$(S_F0L) S_F1L=$(S_F1L) S_F2L=$(S_F2L) S_R0L=$(S_R0L) S_R1L=$(S_R1L) S_R2L=$(S_R2L) S_A0L=$(S_A0L) S_A1L=$(S_A1L) S_A2L=$(S_A2L) S_F0S=$(S_F0S) S_F1S=$(S_F1S) S_F2S=$(S_F2S) S_R0S=$(S_R0S) S_R1S=$(S_R1S) S_R2S=$(S_R2S) S_A0S=$(S_A0S) S_A1S=$(S_A1S) S_A2S=$(S_A2S) I_F0L=$(I_F0L) I_F1L=$(I_F1L) I_F2L=$(I_F2L) I_R0L=$(I_R0L) I_R1L=$(I_R1L) I_R2L=$(I_R2L) I_A0L=$(I_A0L) I_A1L=$(I_A1L) I_A2L=$(I_A2L) I_F0S=$(I_F0S) I_F1S=$(I_F1S) I_F2S=$(I_F2S) I_R0S=$(I_R0S) I_R1S=$(I_R1S) I_R2S=$(I_R2S) I_A0S=$(I_A0S) I_A1S=$(I_A1S) I_A2S=$(I_A2S) clean all run platform=gvsoc runner_args="--trace=isp:log.txt"

gvsoc_isp_sim_trace_smem: build
	cd /scratch/prasadar/siracusa/camera/pulp-sdk/tests/isp/smem_access && make S=$(S) ET=$(ET) RT=$(RT) AT=$(AT) S_AD=$(S_AD) I_AD=$(I_AD) B=$(B) S_F0L=$(S_F0L) S_F1L=$(S_F1L) S_F2L=$(S_F2L) S_R0L=$(S_R0L) S_R1L=$(S_R1L) S_R2L=$(S_R2L) S_A0L=$(S_A0L) S_A1L=$(S_A1L) S_A2L=$(S_A2L) S_F0S=$(S_F0S) S_F1S=$(S_F1S) S_F2S=$(S_F2S) S_R0S=$(S_R0S) S_R1S=$(S_R1S) S_R2S=$(S_R2S) S_A0S=$(S_A0S) S_A1S=$(S_A1S) S_A2S=$(S_A2S) I_F0L=$(I_F0L) I_F1L=$(I_F1L) I_F2L=$(I_F2L) I_R0L=$(I_R0L) I_R1L=$(I_R1L) I_R2L=$(I_R2L) I_A0L=$(I_A0L) I_A1L=$(I_A1L) I_A2L=$(I_A2L) I_F0S=$(I_F0S) I_F1S=$(I_F1S) I_F2S=$(I_F2S) I_R0S=$(I_R0S) I_R1S=$(I_R1S) I_R2S=$(I_R2S) I_A0S=$(I_A0S) I_A1S=$(I_A1S) I_A2S=$(I_A2S) clean all run platform=gvsoc runner_args="--trace=smem --trace=isp"

gvsoc_isp_sim_trace_smem_file: build
	cd /scratch/prasadar/siracusa/camera/pulp-sdk/tests/isp/smem_access && make S=$(S) ET=$(ET) RT=$(RT) AT=$(AT) S_AD=$(S_AD) I_AD=$(I_AD) B=$(B) S_F0L=$(S_F0L) S_F1L=$(S_F1L) S_F2L=$(S_F2L) S_R0L=$(S_R0L) S_R1L=$(S_R1L) S_R2L=$(S_R2L) S_A0L=$(S_A0L) S_A1L=$(S_A1L) S_A2L=$(S_A2L) S_F0S=$(S_F0S) S_F1S=$(S_F1S) S_F2S=$(S_F2S) S_R0S=$(S_R0S) S_R1S=$(S_R1S) S_R2S=$(S_R2S) S_A0S=$(S_A0S) S_A1S=$(S_A1S) S_A2S=$(S_A2S) I_F0L=$(I_F0L) I_F1L=$(I_F1L) I_F2L=$(I_F2L) I_R0L=$(I_R0L) I_R1L=$(I_R1L) I_R2L=$(I_R2L) I_A0L=$(I_A0L) I_A1L=$(I_A1L) I_A2L=$(I_A2L) I_F0S=$(I_F0S) I_F1S=$(I_F1S) I_F2S=$(I_F2S) I_R0S=$(I_R0S) I_R1S=$(I_R1S) I_R2S=$(I_R2S) I_A0S=$(I_A0S) I_A1S=$(I_A1S) I_A2S=$(I_A2S) clean all run platform=gvsoc runner_args="--trace=smem:smem.txt --trace=isp:isp.txt"

gvsoc_isp_sim_trace_all_file: build
	cd /scratch/prasadar/siracusa/camera/pulp-sdk/tests/isp/smem_access && make S=$(S) ET=$(ET) RT=$(RT) AT=$(AT) S_AD=$(S_AD) I_AD=$(I_AD) B=$(B) S_F0L=$(S_F0L) S_F1L=$(S_F1L) S_F2L=$(S_F2L) S_R0L=$(S_R0L) S_R1L=$(S_R1L) S_R2L=$(S_R2L) S_A0L=$(S_A0L) S_A1L=$(S_A1L) S_A2L=$(S_A2L) S_F0S=$(S_F0S) S_F1S=$(S_F1S) S_F2S=$(S_F2S) S_R0S=$(S_R0S) S_R1S=$(S_R1S) S_R2S=$(S_R2S) S_A0S=$(S_A0S) S_A1S=$(S_A1S) S_A2S=$(S_A2S) I_F0L=$(I_F0L) I_F1L=$(I_F1L) I_F2L=$(I_F2L) I_R0L=$(I_R0L) I_R1L=$(I_R1L) I_R2L=$(I_R2L) I_A0L=$(I_A0L) I_A1L=$(I_A1L) I_A2L=$(I_A2L) I_F0S=$(I_F0S) I_F1S=$(I_F1S) I_F2S=$(I_F2S) I_R0S=$(I_R0S) I_R1S=$(I_R1S) I_R2S=$(I_R2S) I_A0S=$(I_A0S) I_A1S=$(I_A1S) I_A2S=$(I_A2S) clean all run platform=gvsoc runner_args="--trace=.*:all.txt"

gvsoc_isp_sim_trace_all: build
	cd /scratch/prasadar/siracusa/camera/pulp-sdk/tests/isp/smem_access && make S=$(S) ET=$(ET) RT=$(RT) AT=$(AT) S_AD=$(S_AD) I_AD=$(I_AD) B=$(B) S_F0L=$(S_F0L) S_F1L=$(S_F1L) S_F2L=$(S_F2L) S_R0L=$(S_R0L) S_R1L=$(S_R1L) S_R2L=$(S_R2L) S_A0L=$(S_A0L) S_A1L=$(S_A1L) S_A2L=$(S_A2L) S_F0S=$(S_F0S) S_F1S=$(S_F1S) S_F2S=$(S_F2S) S_R0S=$(S_R0S) S_R1S=$(S_R1S) S_R2S=$(S_R2S) S_A0S=$(S_A0S) S_A1S=$(S_A1S) S_A2S=$(S_A2S) I_F0L=$(I_F0L) I_F1L=$(I_F1L) I_F2L=$(I_F2L) I_R0L=$(I_R0L) I_R1L=$(I_R1L) I_R2L=$(I_R2L) I_A0L=$(I_A0L) I_A1L=$(I_A1L) I_A2L=$(I_A2L) I_F0S=$(I_F0S) I_F1S=$(I_F1S) I_F2S=$(I_F2S) I_R0S=$(I_R0S) I_R1S=$(I_R1S) I_R2S=$(I_R2S) I_A0S=$(I_A0S) I_A1S=$(I_A1S) I_A2S=$(I_A2S) clean all run platform=gvsoc runner_args="--trace=.*"

gvsoc_isp_sim_args: build
	cd /scratch/prasadar/siracusa/camera/pulp-sdk/tests/isp/smem_access && make S=$(S) ET=$(ET) RT=$(RT) AT=$(AT) S_AD=$(S_AD) I_AD=$(I_AD) B=$(B) S_F0L=$(S_F0L) S_F1L=$(S_F1L) S_F2L=$(S_F2L) S_R0L=$(S_R0L) S_R1L=$(S_R1L) S_R2L=$(S_R2L) S_A0L=$(S_A0L) S_A1L=$(S_A1L) S_A2L=$(S_A2L) S_F0S=$(S_F0S) S_F1S=$(S_F1S) S_F2S=$(S_F2S) S_R0S=$(S_R0S) S_R1S=$(S_R1S) S_R2S=$(S_R2S) S_A0S=$(S_A0S) S_A1S=$(S_A1S) S_A2S=$(S_A2S) I_F0L=$(I_F0L) I_F1L=$(I_F1L) I_F2L=$(I_F2L) I_R0L=$(I_R0L) I_R1L=$(I_R1L) I_R2L=$(I_R2L) I_A0L=$(I_A0L) I_A1L=$(I_A1L) I_A2L=$(I_A2L) I_F0S=$(I_F0S) I_F1S=$(I_F1S) I_F2S=$(I_F2S) I_R0S=$(I_R0S) I_R1S=$(I_R1S) I_R2S=$(I_R2S) I_A0S=$(I_A0S) I_A1S=$(I_A1S) I_A2S=$(I_A2S) clean all run platform=gvsoc runner_args=$(ARGS)


gvsoc_isp_sensor_sim: build
	cd /scratch/prasadar/siracusa/camera/pulp-sdk/tests/sensor/isp_smem_sensor && make S=$(S) ET=$(ET) IET=$(IET) RT=$(RT) AT=$(AT) S_AD=$(S_AD) I_AD=$(I_AD) B=$(B) S_F0L=$(S_F0L) S_F1L=$(S_F1L) S_F2L=$(S_F2L) S_R0L=$(S_R0L) S_R1L=$(S_R1L) S_R2L=$(S_R2L) S_A0L=$(S_A0L) S_A1L=$(S_A1L) S_A2L=$(S_A2L) S_F0S=$(S_F0S) S_F1S=$(S_F1S) S_F2S=$(S_F2S) S_R0S=$(S_R0S) S_R1S=$(S_R1S) S_R2S=$(S_R2S) S_A0S=$(S_A0S) S_A1S=$(S_A1S) S_A2S=$(S_A2S) I_F0L=$(I_F0L) I_F1L=$(I_F1L) I_F2L=$(I_F2L) I_R0L=$(I_R0L) I_R1L=$(I_R1L) I_R2L=$(I_R2L) I_A0L=$(I_A0L) I_A1L=$(I_A1L) I_A2L=$(I_A2L) I_F0S=$(I_F0S) I_F1S=$(I_F1S) I_F2S=$(I_F2S) I_R0S=$(I_R0S) I_R1S=$(I_R1S) I_R2S=$(I_R2S) I_A0S=$(I_A0S) I_A1S=$(I_A1S) I_A2S=$(I_A2S) clean all run platform=gvsoc && python3 filecmp_script.py

gvsoc_isp_sensor_sim_trace: build
	cd /scratch/prasadar/siracusa/camera/pulp-sdk/tests/sensor/isp_smem_sensor && make S=$(S) ET=$(ET) IET=$(IET) RT=$(RT) AT=$(AT) S_AD=$(S_AD) I_AD=$(I_AD) B=$(B) S_F0L=$(S_F0L) S_F1L=$(S_F1L) S_F2L=$(S_F2L) S_R0L=$(S_R0L) S_R1L=$(S_R1L) S_R2L=$(S_R2L) S_A0L=$(S_A0L) S_A1L=$(S_A1L) S_A2L=$(S_A2L) S_F0S=$(S_F0S) S_F1S=$(S_F1S) S_F2S=$(S_F2S) S_R0S=$(S_R0S) S_R1S=$(S_R1S) S_R2S=$(S_R2S) S_A0S=$(S_A0S) S_A1S=$(S_A1S) S_A2S=$(S_A2S) I_F0L=$(I_F0L) I_F1L=$(I_F1L) I_F2L=$(I_F2L) I_R0L=$(I_R0L) I_R1L=$(I_R1L) I_R2L=$(I_R2L) I_A0L=$(I_A0L) I_A1L=$(I_A1L) I_A2L=$(I_A2L) I_F0S=$(I_F0S) I_F1S=$(I_F1S) I_F2S=$(I_F2S) I_R0S=$(I_R0S) I_R1S=$(I_R1S) I_R2S=$(I_R2S) I_A0S=$(I_A0S) I_A1S=$(I_A1S) I_A2S=$(I_A2S) clean all run platform=gvsoc runner_args="--trace=isp/trace --trace=sensor/trace --trace=smem/trace" && python3 filecmp_script.py

gvsoc_isp_sensor_sim_trace_file: build
	cd /scratch/prasadar/siracusa/camera/pulp-sdk/tests/sensor/isp_smem_sensor && make S=$(S) ET=$(ET) IET=$(IET) RT=$(RT) AT=$(AT) S_AD=$(S_AD) I_AD=$(I_AD) B=$(B) S_F0L=$(S_F0L) S_F1L=$(S_F1L) S_F2L=$(S_F2L) S_R0L=$(S_R0L) S_R1L=$(S_R1L) S_R2L=$(S_R2L) S_A0L=$(S_A0L) S_A1L=$(S_A1L) S_A2L=$(S_A2L) S_F0S=$(S_F0S) S_F1S=$(S_F1S) S_F2S=$(S_F2S) S_R0S=$(S_R0S) S_R1S=$(S_R1S) S_R2S=$(S_R2S) S_A0S=$(S_A0S) S_A1S=$(S_A1S) S_A2S=$(S_A2S) I_F0L=$(I_F0L) I_F1L=$(I_F1L) I_F2L=$(I_F2L) I_R0L=$(I_R0L) I_R1L=$(I_R1L) I_R2L=$(I_R2L) I_A0L=$(I_A0L) I_A1L=$(I_A1L) I_A2L=$(I_A2L) I_F0S=$(I_F0S) I_F1S=$(I_F1S) I_F2S=$(I_F2S) I_R0S=$(I_R0S) I_R1S=$(I_R1S) I_R2S=$(I_R2S) I_A0S=$(I_A0S) I_A1S=$(I_A1S) I_A2S=$(I_A2S) clean all run platform=gvsoc runner_args="--trace=isp:isp.txt --trace=sensor:sensor.txt --trace=smem:smem.txt" && python3 filecmp_script.py

gvsoc_isp_sensor_sim_trace_all_file: build
	cd /scratch/prasadar/siracusa/camera/pulp-sdk/tests/sensor/isp_smem_sensor && make S=$(S) ET=$(ET) IET=$(IET) RT=$(RT) AT=$(AT) S_AD=$(S_AD) I_AD=$(I_AD) B=$(B) S_F0L=$(S_F0L) S_F1L=$(S_F1L) S_F2L=$(S_F2L) S_R0L=$(S_R0L) S_R1L=$(S_R1L) S_R2L=$(S_R2L) S_A0L=$(S_A0L) S_A1L=$(S_A1L) S_A2L=$(S_A2L) S_F0S=$(S_F0S) S_F1S=$(S_F1S) S_F2S=$(S_F2S) S_R0S=$(S_R0S) S_R1S=$(S_R1S) S_R2S=$(S_R2S) S_A0S=$(S_A0S) S_A1S=$(S_A1S) S_A2S=$(S_A2S) I_F0L=$(I_F0L) I_F1L=$(I_F1L) I_F2L=$(I_F2L) I_R0L=$(I_R0L) I_R1L=$(I_R1L) I_R2L=$(I_R2L) I_A0L=$(I_A0L) I_A1L=$(I_A1L) I_A2L=$(I_A2L) I_F0S=$(I_F0S) I_F1S=$(I_F1S) I_F2S=$(I_F2S) I_R0S=$(I_R0S) I_R1S=$(I_R1S) I_R2S=$(I_R2S) I_A0S=$(I_A0S) I_A1S=$(I_A1S) I_A2S=$(I_A2S) clean all run platform=gvsoc runner_args="--trace=.*:all.txt" && python3 filecmp_script.py

gvsoc_isp_sensor_sim_trace_all: build
	cd /scratch/prasadar/siracusa/camera/pulp-sdk/tests/sensor/isp_smem_sensor && make S=$(S) ET=$(ET) IET=$(IET) RT=$(RT) AT=$(AT) S_AD=$(S_AD) I_AD=$(I_AD) B=$(B) S_F0L=$(S_F0L) S_F1L=$(S_F1L) S_F2L=$(S_F2L) S_R0L=$(S_R0L) S_R1L=$(S_R1L) S_R2L=$(S_R2L) S_A0L=$(S_A0L) S_A1L=$(S_A1L) S_A2L=$(S_A2L) S_F0S=$(S_F0S) S_F1S=$(S_F1S) S_F2S=$(S_F2S) S_R0S=$(S_R0S) S_R1S=$(S_R1S) S_R2S=$(S_R2S) S_A0S=$(S_A0S) S_A1S=$(S_A1S) S_A2S=$(S_A2S) I_F0L=$(I_F0L) I_F1L=$(I_F1L) I_F2L=$(I_F2L) I_R0L=$(I_R0L) I_R1L=$(I_R1L) I_R2L=$(I_R2L) I_A0L=$(I_A0L) I_A1L=$(I_A1L) I_A2L=$(I_A2L) I_F0S=$(I_F0S) I_F1S=$(I_F1S) I_F2S=$(I_F2S) I_R0S=$(I_R0S) I_R1S=$(I_R1S) I_R2S=$(I_R2S) I_A0S=$(I_A0S) I_A1S=$(I_A1S) I_A2S=$(I_A2S) clean all run platform=gvsoc runner_args="--trace=.*" && python3 filecmp_script.py


gvsoc_hello: build 
	cd tests/hello && make clean all run

gvsoc_hello_trace: build 
	cd tests/hello && make clean all run runner_args="--trace=fc"

gvsoc_hello_trace_all: build 
	cd tests/hello && make clean all run runner_args="--trace=.* --trace-level=trace"


all: checkout build


.PHONY: build