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

EL ?= 8
RL ?= 3
DL ?= 10
NI ?= 0
NR ?= 2
NC ?= 16
ARGS ?= "--trace=cmem:cmem.txt --trace=camera:camera.txt --trace=converter:converter.txt"

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
	cd /scratch/prasadar/siracusa/camera/pulp-sdk/tests/camera/cmem_access && make clean EL=$(EL) RL=$(RL) DL=$(DL) NI=$(NI) NR=$(NR) NC=$(NC) run platform=gvsoc

gvsoc_sim_trace: build
	cd /scratch/prasadar/siracusa/camera/pulp-sdk/tests/camera/cmem_access && make clean EL=$(EL) RL=$(RL) DL=$(DL) NI=$(NI) NR=$(NR) NC=$(NC) run platform=gvsoc runner_args="--trace=camera --trace-level=trace"

gvsoc_sim_trace_file: build
	cd /scratch/prasadar/siracusa/camera/pulp-sdk/tests/camera/cmem_access && make clean EL=$(EL) RL=$(RL) DL=$(DL) NI=$(NI) NR=$(NR) NC=$(NC) run platform=gvsoc runner_args="--trace=camera:log.txt"

gvsoc_sim_trace_cmem_file: build
	cd /scratch/prasadar/siracusa/camera/pulp-sdk/tests/camera/cmem_access && make clean EL=$(EL) RL=$(RL) DL=$(DL) NI=$(NI) NR=$(NR) NC=$(NC) run platform=gvsoc runner_args="--trace=cmem:cmem.txt --trace=camera:camera.txt"

gvsoc_sim_trace_all_file: build
	cd /scratch/prasadar/siracusa/camera/pulp-sdk/tests/camera/cmem_access && make clean EL=$(EL) RL=$(RL) DL=$(DL) NI=$(NI) NR=$(NR) NC=$(NC) run platform=gvsoc runner_args="--trace=.*:all.txt"

gvsoc_sim_trace_all: build
	cd /scratch/prasadar/siracusa/camera/pulp-sdk/tests/camera/cmem_access && make clean EL=$(EL) RL=$(RL) DL=$(DL) NI=$(NI) NR=$(NR) NC=$(NC) run platform=gvsoc runner_args="--trace=.*"

gvsoc_sim_run_args: build
	cd /scratch/prasadar/siracusa/camera/pulp-sdk/tests/camera/cmem_access && make clean EL=$(EL) RL=$(RL) DL=$(DL) NI=$(NI) NR=$(NR) NC=$(NC) run platform=gvsoc runner_args=$(ARGS)
all: checkout build


.PHONY: build