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
AT ?= 0
AD ?= 64
IET ?= 5
B ?= 0x10c00000

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

A0L=8
A1L=20
A2L=1
R0L=480
R1L=1
R2L=1
F0L=2
F1L=4
F2L=1
A0S=4
A1S=32
A2S=0
R0S=640
R1S=0
R2S=0
F0S=0x04000000
F1S=640*480
F2S=640*480*4
AD=64


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
	cd /scratch/prasadar/siracusa/camera/pulp-sdk/tests/sensor/smem_access && make S=$(S) ET=$(ET) RT=$(RT) AT=$(AT) AD=$(AD) B=$(B) F0L=$(F0L) F1L=$(F1L) F2L=$(F2L) R0L=$(R0L) R1L=$(R1L) R2L=$(R2L) A0L=$(A0L) A1L=$(A1L) A2L=$(A2L) F0S=$(F0S) F1S=$(F1S) F2S=$(F2S) R0S=$(R0S) R1S=$(R1S) R2S=$(R2S) A0S=$(A0S) A1S=$(A1S) A2S=$(A2S) clean all run platform=gvsoc

gvsoc_sensor_sim_trace: build
	cd /scratch/prasadar/siracusa/camera/pulp-sdk/tests/sensor/smem_access && make S=$(S) ET=$(ET) RT=$(RT) AT=$(AT) AD=$(AD) B=$(B) F0L=$(F0L) F1L=$(F1L) F2L=$(F2L) R0L=$(R0L) R1L=$(R1L) R2L=$(R2L) A0L=$(A0L) A1L=$(A1L) A2L=$(A2L) F0S=$(F0S) F1S=$(F1S) F2S=$(F2S) R0S=$(R0S) R1S=$(R1S) R2S=$(R2S) A0S=$(A0S) A1S=$(A1S) A2S=$(A2S) clean all run platform=gvsoc runner_args="--trace=sensor/trace"

gvsoc_sensor_sim_trace_file: build
	cd /scratch/prasadar/siracusa/camera/pulp-sdk/tests/sensor/smem_access && make S=$(S) ET=$(ET) RT=$(RT) AT=$(AT) AD=$(AD) B=$(B) F0L=$(F0L) F1L=$(F1L) F2L=$(F2L) R0L=$(R0L) R1L=$(R1L) R2L=$(R2L) A0L=$(A0L) A1L=$(A1L) A2L=$(A2L) F0S=$(F0S) F1S=$(F1S) F2S=$(F2S) R0S=$(R0S) R1S=$(R1S) R2S=$(R2S) A0S=$(A0S) A1S=$(A1S) A2S=$(A2S) clean all run platform=gvsoc runner_args="--trace=sensor:log.txt"

gvsoc_sensor_sim_trace_smem: build
	cd /scratch/prasadar/siracusa/camera/pulp-sdk/tests/sensor/smem_access && make S=$(S) ET=$(ET) RT=$(RT) AT=$(AT) AD=$(AD) B=$(B) F0L=$(F0L) F1L=$(F1L) F2L=$(F2L) R0L=$(R0L) R1L=$(R1L) R2L=$(R2L) A0L=$(A0L) A1L=$(A1L) A2L=$(A2L) F0S=$(F0S) F1S=$(F1S) F2S=$(F2S) R0S=$(R0S) R1S=$(R1S) R2S=$(R2S) A0S=$(A0S) A1S=$(A1S) A2S=$(A2S) clean all run platform=gvsoc runner_args="--trace=smem --trace=sensor"

gvsoc_sensor_sim_trace_smem_file: build
	cd /scratch/prasadar/siracusa/camera/pulp-sdk/tests/sensor/smem_access && make S=$(S) ET=$(ET) RT=$(RT) AT=$(AT) AD=$(AD) B=$(B) F0L=$(F0L) F1L=$(F1L) F2L=$(F2L) R0L=$(R0L) R1L=$(R1L) R2L=$(R2L) A0L=$(A0L) A1L=$(A1L) A2L=$(A2L) F0S=$(F0S) F1S=$(F1S) F2S=$(F2S) R0S=$(R0S) R1S=$(R1S) R2S=$(R2S) A0S=$(A0S) A1S=$(A1S) A2S=$(A2S) clean all run platform=gvsoc runner_args="--trace=smem:smem.txt --trace=sensor:sensor.txt"

gvsoc_sensor_sim_trace_all_file: build
	cd /scratch/prasadar/siracusa/camera/pulp-sdk/tests/sensor/smem_access && make S=$(S) ET=$(ET) RT=$(RT) AT=$(AT) AD=$(AD) B=$(B) F0L=$(F0L) F1L=$(F1L) F2L=$(F2L) R0L=$(R0L) R1L=$(R1L) R2L=$(R2L) A0L=$(A0L) A1L=$(A1L) A2L=$(A2L) F0S=$(F0S) F1S=$(F1S) F2S=$(F2S) R0S=$(R0S) R1S=$(R1S) R2S=$(R2S) A0S=$(A0S) A1S=$(A1S) A2S=$(A2S) clean all run platform=gvsoc runner_args="--trace=.*:all.txt"

gvsoc_sensor_sim_trace_all: build
	cd /scratch/prasadar/siracusa/camera/pulp-sdk/tests/sensor/smem_access && make S=$(S) ET=$(ET) RT=$(RT) AT=$(AT) AD=$(AD) B=$(B) F0L=$(F0L) F1L=$(F1L) F2L=$(F2L) R0L=$(R0L) R1L=$(R1L) R2L=$(R2L) A0L=$(A0L) A1L=$(A1L) A2L=$(A2L) F0S=$(F0S) F1S=$(F1S) F2S=$(F2S) R0S=$(R0S) R1S=$(R1S) R2S=$(R2S) A0S=$(A0S) A1S=$(A1S) A2S=$(A2S) clean all run platform=gvsoc runner_args="--trace=.*"

gvsoc_sensor_sim_args: build
	cd /scratch/prasadar/siracusa/camera/pulp-sdk/tests/sensor/smem_access && make S=$(S) ET=$(ET) RT=$(RT) AT=$(AT) AD=$(AD) B=$(B) F0L=$(F0L) F1L=$(F1L) F2L=$(F2L) R0L=$(R0L) R1L=$(R1L) R2L=$(R2L) A0L=$(A0L) A1L=$(A1L) A2L=$(A2L) F0S=$(F0S) F1S=$(F1S) F2S=$(F2S) R0S=$(R0S) R1S=$(R1S) R2S=$(R2S) A0S=$(A0S) A1S=$(A1S) A2S=$(A2S) clean all run platform=gvsoc runner_args=$(ARGS)


gvsoc_isp_sim: build
	cd /scratch/prasadar/siracusa/camera/pulp-sdk/tests/isp/smem_access && make S=$(S) ET=$(ET) RT=$(RT) AT=$(AT) AD=$(AD) B=$(B) F0L=$(F0L) F1L=$(F1L) F2L=$(F2L) R0L=$(R0L) R1L=$(R1L) R2L=$(R2L) A0L=$(A0L) A1L=$(A1L) A2L=$(A2L) F0S=$(F0S) F1S=$(F1S) F2S=$(F2S) R0S=$(R0S) R1S=$(R1S) R2S=$(R2S) A0S=$(A0S) A1S=$(A1S) A2S=$(A2S) clean all run platform=gvsoc

gvsoc_isp_sim_trace: build
	cd /scratch/prasadar/siracusa/camera/pulp-sdk/tests/isp/smem_access && make S=$(S) ET=$(ET) RT=$(RT) AT=$(AT) AD=$(AD) B=$(B) F0L=$(F0L) F1L=$(F1L) F2L=$(F2L) R0L=$(R0L) R1L=$(R1L) R2L=$(R2L) A0L=$(A0L) A1L=$(A1L) A2L=$(A2L) F0S=$(F0S) F1S=$(F1S) F2S=$(F2S) R0S=$(R0S) R1S=$(R1S) R2S=$(R2S) A0S=$(A0S) A1S=$(A1S) A2S=$(A2S) clean all run platform=gvsoc runner_args="--trace=isp/trace"

gvsoc_isp_sim_trace_file: build
	cd /scratch/prasadar/siracusa/camera/pulp-sdk/tests/isp/smem_access && make S=$(S) ET=$(ET) RT=$(RT) AT=$(AT) AD=$(AD) B=$(B) F0L=$(F0L) F1L=$(F1L) F2L=$(F2L) R0L=$(R0L) R1L=$(R1L) R2L=$(R2L) A0L=$(A0L) A1L=$(A1L) A2L=$(A2L) F0S=$(F0S) F1S=$(F1S) F2S=$(F2S) R0S=$(R0S) R1S=$(R1S) R2S=$(R2S) A0S=$(A0S) A1S=$(A1S) A2S=$(A2S) clean all run platform=gvsoc runner_args="--trace=isp:log.txt"

gvsoc_isp_sim_trace_smem: build
	cd /scratch/prasadar/siracusa/camera/pulp-sdk/tests/isp/smem_access && make S=$(S) ET=$(ET) RT=$(RT) AT=$(AT) AD=$(AD) B=$(B) F0L=$(F0L) F1L=$(F1L) F2L=$(F2L) R0L=$(R0L) R1L=$(R1L) R2L=$(R2L) A0L=$(A0L) A1L=$(A1L) A2L=$(A2L) F0S=$(F0S) F1S=$(F1S) F2S=$(F2S) R0S=$(R0S) R1S=$(R1S) R2S=$(R2S) A0S=$(A0S) A1S=$(A1S) A2S=$(A2S) clean all run platform=gvsoc runner_args="--trace=smem --trace=isp"

gvsoc_isp_sim_trace_smem_file: build
	cd /scratch/prasadar/siracusa/camera/pulp-sdk/tests/isp/smem_access && make S=$(S) ET=$(ET) RT=$(RT) AT=$(AT) AD=$(AD) B=$(B) F0L=$(F0L) F1L=$(F1L) F2L=$(F2L) R0L=$(R0L) R1L=$(R1L) R2L=$(R2L) A0L=$(A0L) A1L=$(A1L) A2L=$(A2L) F0S=$(F0S) F1S=$(F1S) F2S=$(F2S) R0S=$(R0S) R1S=$(R1S) R2S=$(R2S) A0S=$(A0S) A1S=$(A1S) A2S=$(A2S) clean all run platform=gvsoc runner_args="--trace=smem:smem.txt --trace=isp:isp.txt"

gvsoc_isp_sim_trace_all_file: build
	cd /scratch/prasadar/siracusa/camera/pulp-sdk/tests/isp/smem_access && make S=$(S) ET=$(ET) RT=$(RT) AT=$(AT) AD=$(AD) B=$(B) F0L=$(F0L) F1L=$(F1L) F2L=$(F2L) R0L=$(R0L) R1L=$(R1L) R2L=$(R2L) A0L=$(A0L) A1L=$(A1L) A2L=$(A2L) F0S=$(F0S) F1S=$(F1S) F2S=$(F2S) R0S=$(R0S) R1S=$(R1S) R2S=$(R2S) A0S=$(A0S) A1S=$(A1S) A2S=$(A2S) clean all run platform=gvsoc runner_args="--trace=.*:all.txt"

gvsoc_isp_sim_trace_all: build
	cd /scratch/prasadar/siracusa/camera/pulp-sdk/tests/isp/smem_access && make S=$(S) ET=$(ET) RT=$(RT) AT=$(AT) AD=$(AD) B=$(B) F0L=$(F0L) F1L=$(F1L) F2L=$(F2L) R0L=$(R0L) R1L=$(R1L) R2L=$(R2L) A0L=$(A0L) A1L=$(A1L) A2L=$(A2L) F0S=$(F0S) F1S=$(F1S) F2S=$(F2S) R0S=$(R0S) R1S=$(R1S) R2S=$(R2S) A0S=$(A0S) A1S=$(A1S) A2S=$(A2S) clean all run platform=gvsoc runner_args="--trace=.*"

gvsoc_isp_sim_args: build
	cd /scratch/prasadar/siracusa/camera/pulp-sdk/tests/isp/smem_access && make S=$(S) ET=$(ET) RT=$(RT) AT=$(AT) AD=$(AD) B=$(B) F0L=$(F0L) F1L=$(F1L) F2L=$(F2L) R0L=$(R0L) R1L=$(R1L) R2L=$(R2L) A0L=$(A0L) A1L=$(A1L) A2L=$(A2L) F0S=$(F0S) F1S=$(F1S) F2S=$(F2S) R0S=$(R0S) R1S=$(R1S) R2S=$(R2S) A0S=$(A0S) A1S=$(A1S) A2S=$(A2S) clean all run platform=gvsoc runner_args=$(ARGS)


gvsoc_isp_sensor_sim: build
	cd /scratch/prasadar/siracusa/camera/pulp-sdk/tests/sensor/isp_smem_sensor && make S=$(S) ET=$(ET) IET=$(IET) RT=$(RT) AT=$(AT) AD=$(AD) B=$(B) F0L=$(F0L) F1L=$(F1L) F2L=$(F2L) R0L=$(R0L) R1L=$(R1L) R2L=$(R2L) A0L=$(A0L) A1L=$(A1L) A2L=$(A2L) F0S=$(F0S) F1S=$(F1S) F2S=$(F2S) R0S=$(R0S) R1S=$(R1S) R2S=$(R2S) A0S=$(A0S) A1S=$(A1S) A2S=$(A2S) clean all run platform=gvsoc && python3 filecmp_script.py

gvsoc_isp_sensor_sim_trace: build
	cd /scratch/prasadar/siracusa/camera/pulp-sdk/tests/sensor/isp_smem_sensor && make S=$(S) ET=$(ET) IET=$(IET) RT=$(RT) AT=$(AT) AD=$(AD) B=$(B) F0L=$(F0L) F1L=$(F1L) F2L=$(F2L) R0L=$(R0L) R1L=$(R1L) R2L=$(R2L) A0L=$(A0L) A1L=$(A1L) A2L=$(A2L) F0S=$(F0S) F1S=$(F1S) F2S=$(F2S) R0S=$(R0S) R1S=$(R1S) R2S=$(R2S) A0S=$(A0S) A1S=$(A1S) A2S=$(A2S) clean all run platform=gvsoc runner_args="--trace=isp/trace --trace=sensor/trace --trace=smem/trace" && python3 filecmp_script.py

gvsoc_isp_sensor_sim_trace_file: build
	cd /scratch/prasadar/siracusa/camera/pulp-sdk/tests/sensor/isp_smem_sensor && make S=$(S) ET=$(ET) IET=$(IET) RT=$(RT) AT=$(AT) AD=$(AD) B=$(B) F0L=$(F0L) F1L=$(F1L) F2L=$(F2L) R0L=$(R0L) R1L=$(R1L) R2L=$(R2L) A0L=$(A0L) A1L=$(A1L) A2L=$(A2L) F0S=$(F0S) F1S=$(F1S) F2S=$(F2S) R0S=$(R0S) R1S=$(R1S) R2S=$(R2S) A0S=$(A0S) A1S=$(A1S) A2S=$(A2S) clean all run platform=gvsoc runner_args="--trace=isp:isp.txt --trace=sensor:sensor.txt --trace=smem:smem.txt" && python3 filecmp_script.py

gvsoc_isp_sensor_sim_trace_all_file: build
	cd /scratch/prasadar/siracusa/camera/pulp-sdk/tests/sensor/isp_smem_sensor && make S=$(S) ET=$(ET) IET=$(IET) RT=$(RT) AT=$(AT) AD=$(AD) B=$(B) F0L=$(F0L) F1L=$(F1L) F2L=$(F2L) R0L=$(R0L) R1L=$(R1L) R2L=$(R2L) A0L=$(A0L) A1L=$(A1L) A2L=$(A2L) F0S=$(F0S) F1S=$(F1S) F2S=$(F2S) R0S=$(R0S) R1S=$(R1S) R2S=$(R2S) A0S=$(A0S) A1S=$(A1S) A2S=$(A2S) clean all run platform=gvsoc runner_args="--trace=.*:all.txt" && python3 filecmp_script.py

gvsoc_isp_sensor_sim_trace_all: build
	cd /scratch/prasadar/siracusa/camera/pulp-sdk/tests/sensor/isp_smem_sensor && make S=$(S) ET=$(ET) IET=$(IET) RT=$(RT) AT=$(AT) AD=$(AD) B=$(B) F0L=$(F0L) F1L=$(F1L) F2L=$(F2L) R0L=$(R0L) R1L=$(R1L) R2L=$(R2L) A0L=$(A0L) A1L=$(A1L) A2L=$(A2L) F0S=$(F0S) F1S=$(F1S) F2S=$(F2S) R0S=$(R0S) R1S=$(R1S) R2S=$(R2S) A0S=$(A0S) A1S=$(A1S) A2S=$(A2S) clean all run platform=gvsoc runner_args="--trace=.*" && python3 filecmp_script.py

all: checkout build


.PHONY: build