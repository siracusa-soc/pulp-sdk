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
ET ?= 10
RT ?= 2
AT ?= 4
AD ?= 32
B ?= 0x10c00000

A0L ?= 32
A1L ?= 20
A2L ?= 1
R0L ?= 480
R1L ?= 1
R2L ?= 1
F0L ?= 8
F1L ?= 1
F2L ?= 1
A0S ?= 1
A1S ?= 32
A2S ?= 0
R0S ?= 640
R1S ?= 0
R2S ?= 0
F0S ?= 0x01000000
F1S ?= 640*480
F2S ?= 0

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
	cd /scratch/prasadar/siracusa/camera/pulp-sdk/tests/sensor/smem_access && make S=$(S) ET=$(ET) RT=$(RT) AT=$(AT) AD=$(AD) B=$(B) F0L=$(F0L) F1L=$(F1L) F2L=$(F2L) R0L=$(R0L) R1L=$(R1L) R2L=$(R2L) A0L=$(A0L) A1L=$(A1L) A2L=$(A2L) F0S=$(F0S) F1S=$(F1S) F2S=$(F2S) R0S=$(R0S) R1S=$(R1S) R2S=$(R2S) A0S=$(A0S) A1S=$(A1S) A2S=$(A2S) clean all run platform=gvsoc

gvsoc_sim_trace: build
	cd /scratch/prasadar/siracusa/camera/pulp-sdk/tests/sensor/smem_access && make S=$(S) ET=$(ET) RT=$(RT) AT=$(AT) AD=$(AD) B=$(B) F0L=$(F0L) F1L=$(F1L) F2L=$(F2L) R0L=$(R0L) R1L=$(R1L) R2L=$(R2L) A0L=$(A0L) A1L=$(A1L) A2L=$(A2L) F0S=$(F0S) F1S=$(F1S) F2S=$(F2S) R0S=$(R0S) R1S=$(R1S) R2S=$(R2S) A0S=$(A0S) A1S=$(A1S) A2S=$(A2S) clean all run platform=gvsoc runner_args="--trace=sensor/trace"

gvsoc_sim_trace_file: build
	cd /scratch/prasadar/siracusa/camera/pulp-sdk/tests/sensor/smem_access && make S=$(S) ET=$(ET) RT=$(RT) AT=$(AT) AD=$(AD) B=$(B) F0L=$(F0L) F1L=$(F1L) F2L=$(F2L) R0L=$(R0L) R1L=$(R1L) R2L=$(R2L) A0L=$(A0L) A1L=$(A1L) A2L=$(A2L) F0S=$(F0S) F1S=$(F1S) F2S=$(F2S) R0S=$(R0S) R1S=$(R1S) R2S=$(R2S) A0S=$(A0S) A1S=$(A1S) A2S=$(A2S) clean all run platform=gvsoc runner_args="--trace=sensor:log.txt"

gvsoc_sim_trace_smem: build
	cd /scratch/prasadar/siracusa/camera/pulp-sdk/tests/sensor/smem_access && make S=$(S) ET=$(ET) RT=$(RT) AT=$(AT) AD=$(AD) B=$(B) F0L=$(F0L) F1L=$(F1L) F2L=$(F2L) R0L=$(R0L) R1L=$(R1L) R2L=$(R2L) A0L=$(A0L) A1L=$(A1L) A2L=$(A2L) F0S=$(F0S) F1S=$(F1S) F2S=$(F2S) R0S=$(R0S) R1S=$(R1S) R2S=$(R2S) A0S=$(A0S) A1S=$(A1S) A2S=$(A2S) clean all run platform=gvsoc runner_args="--trace=smem --trace=sensor"

gvsoc_sim_trace_smem_file: build
	cd /scratch/prasadar/siracusa/camera/pulp-sdk/tests/sensor/smem_access && make S=$(S) ET=$(ET) RT=$(RT) AT=$(AT) AD=$(AD) B=$(B) F0L=$(F0L) F1L=$(F1L) F2L=$(F2L) R0L=$(R0L) R1L=$(R1L) R2L=$(R2L) A0L=$(A0L) A1L=$(A1L) A2L=$(A2L) F0S=$(F0S) F1S=$(F1S) F2S=$(F2S) R0S=$(R0S) R1S=$(R1S) R2S=$(R2S) A0S=$(A0S) A1S=$(A1S) A2S=$(A2S) clean all run platform=gvsoc runner_args="--trace=smem:smem.txt --trace=sensor:sensor.txt"

gvsoc_sim_trace_all_file: build
	cd /scratch/prasadar/siracusa/camera/pulp-sdk/tests/sensor/smem_access && make S=$(S) ET=$(ET) RT=$(RT) AT=$(AT) AD=$(AD) B=$(B) F0L=$(F0L) F1L=$(F1L) F2L=$(F2L) R0L=$(R0L) R1L=$(R1L) R2L=$(R2L) A0L=$(A0L) A1L=$(A1L) A2L=$(A2L) F0S=$(F0S) F1S=$(F1S) F2S=$(F2S) R0S=$(R0S) R1S=$(R1S) R2S=$(R2S) A0S=$(A0S) A1S=$(A1S) A2S=$(A2S) clean all run platform=gvsoc runner_args="--trace=.*:all.txt"

gvsoc_sim_trace_all: build
	cd /scratch/prasadar/siracusa/camera/pulp-sdk/tests/sensor/smem_access && make S=$(S) ET=$(ET) RT=$(RT) AT=$(AT) AD=$(AD) B=$(B) F0L=$(F0L) F1L=$(F1L) F2L=$(F2L) R0L=$(R0L) R1L=$(R1L) R2L=$(R2L) A0L=$(A0L) A1L=$(A1L) A2L=$(A2L) F0S=$(F0S) F1S=$(F1S) F2S=$(F2S) R0S=$(R0S) R1S=$(R1S) R2S=$(R2S) A0S=$(A0S) A1S=$(A1S) A2S=$(A2S) clean all run platform=gvsoc runner_args="--trace=.*"

gvsoc_sim_args: build
	cd /scratch/prasadar/siracusa/camera/pulp-sdk/tests/sensor/smem_access && make S=$(S) ET=$(ET) RT=$(RT) AT=$(AT) AD=$(AD) B=$(B) F0L=$(F0L) F1L=$(F1L) F2L=$(F2L) R0L=$(R0L) R1L=$(R1L) R2L=$(R2L) A0L=$(A0L) A1L=$(A1L) A2L=$(A2L) F0S=$(F0S) F1S=$(F1S) F2S=$(F2S) R0S=$(R0S) R1S=$(R1S) R2S=$(R2S) A0S=$(A0S) A1S=$(A1S) A2S=$(A2S) clean all run platform=gvsoc runner_args=$(ARGS)
all: checkout build


.PHONY: build