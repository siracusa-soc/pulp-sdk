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

HR ?= 640
VR ?= 480
F ?= 10
S ?= 0
ET ?= 10
RT ?= 2
AT ?= 4
AD ?= 32
B1 ?= 0x10c00000
B2 ?= 0x14c00000

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


gvsoc_sim: build
	cd /scratch/prasadar/siracusa/camera/pulp-sdk/tests/sensor/smem_access && make HR=$(HR) VR=$(VR) F=$(F) S=$(S) ET=$(ET) RT=$(RT) AT=$(AT) AD=$(AD) B1=$(B1) B2=$(B2) clean all run platform=gvsoc

gvsoc_sim_trace: build
	cd /scratch/prasadar/siracusa/camera/pulp-sdk/tests/sensor/smem_access && make HR=$(HR) VR=$(VR) F=$(F) S=$(S) ET=$(ET) RT=$(RT) AT=$(AT) AD=$(AD) B1=$(B1) B2=$(B2) clean all run platform=gvsoc runner_args="--trace=sensor/trace"

gvsoc_sim_trace_file: build
	cd /scratch/prasadar/siracusa/camera/pulp-sdk/tests/sensor/smem_access && make HR=$(HR) VR=$(VR) F=$(F) S=$(S) ET=$(ET) RT=$(RT) AT=$(AT) AD=$(AD) B1=$(B1) B2=$(B2) clean all run platform=gvsoc runner_args="--trace=sensor:log.txt"

gvsoc_sim_trace_smem: build
	cd /scratch/prasadar/siracusa/camera/pulp-sdk/tests/sensor/smem_access && make HR=$(HR) VR=$(VR) F=$(F) S=$(S) ET=$(ET) RT=$(RT) AT=$(AT) AD=$(AD) B1=$(B1) B2=$(B2) clean all run platform=gvsoc runner_args="--trace=smem --trace=sensor"

gvsoc_sim_trace_smem_file: build
	cd /scratch/prasadar/siracusa/camera/pulp-sdk/tests/sensor/smem_access && make HR=$(HR) VR=$(VR) F=$(F) S=$(S) ET=$(ET) RT=$(RT) AT=$(AT) AD=$(AD) B1=$(B1) B2=$(B2) clean all run platform=gvsoc runner_args="--trace=smem:smem.txt --trace=sensor:sensor.txt"

gvsoc_sim_trace_all_file: build
	cd /scratch/prasadar/siracusa/camera/pulp-sdk/tests/sensor/smem_access && make HR=$(HR) VR=$(VR) F=$(F) S=$(S) ET=$(ET) RT=$(RT) AT=$(AT) AD=$(AD) B1=$(B1) B2=$(B2) clean all run platform=gvsoc runner_args="--trace=.*:all.txt"

gvsoc_sim_trace_all: build
	cd /scratch/prasadar/siracusa/camera/pulp-sdk/tests/sensor/smem_access && make HR=$(HR) VR=$(VR) F=$(F) S=$(S) ET=$(ET) RT=$(RT) AT=$(AT) AD=$(AD) B1=$(B1) B2=$(B2) clean all run platform=gvsoc runner_args="--trace=.*"

gvsoc_sim_args: build
	cd /scratch/prasadar/siracusa/camera/pulp-sdk/tests/sensor/smem_access && make HR=$(HR) VR=$(VR) F=$(F) S=$(S) ET=$(ET) RT=$(RT) AT=$(AT) AD=$(AD) B1=$(B1) B2=$(B2) clean all run platform=gvsoc runner_args=$(ARGS)
all: checkout build


.PHONY: build