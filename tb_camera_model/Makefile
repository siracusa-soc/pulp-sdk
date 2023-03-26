#
# Copyright (C) 2018-2020 ETH Zurich and University of Bologna
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

mkfile_path := $(dir $(abspath $(firstword $(MAKEFILE_LIST))))
gui ?= 0
P_STALL ?= 0.0
BUILD_DIR ?= build
TEST_SRCS ?= inc

# SHELL=bash

# 
$(eval HOST = $(shell hostname -d))
IIS_HOST_DOMAIN ?= ee.ethz.ch

# NE16 model compilation
ifeq ($(HOST), $(IIS_HOST_DOMAIN))
	CMAKE_CMD = CMAKE_PREFIX_PATH=../deps/install CXX=g++-9.2.0 cmake
else
	CMAKE_CMD = CMAKE_PREFIX_PATH=../deps/install cmake
endif

# execution parameters
RANDOM_SEED ?= 1234

# NE16 parameters

EL ?= 8
RL ?= 3
DL ?= 10
NI ?= 0
NR ?= 2
NC ?= 16
BW ?= 32

BIG_BUILD_DIR ?= $(shell pwd)/$(BUILD_DIR)/$(UUID)EL$(K_IN)_RL$(RL)_DL$(DL)_NI$(NI)_NR$(NR)_NC$(NC)_BW$(BW)

$(BIG_BUILD_DIR):
	mkdir -p $(BIG_BUILD_DIR)

all:
	$(MAKE) clean
	$(MAKE) stimuli
	$(MAKE) sim

stimuli: $(BIG_BUILD_DIR)
	ln -sfn $(shell pwd)/templates/* $(BIG_BUILD_DIR)/

################################################################################
## Cleanup Scripts
################################################################################

clean-sw:
	rm -rf $(BIG_BUILD_DIR)

clean: clean-sw

sim:
	if [ -d $(BIG_BUILD_DIR) ]; then cd $(BIG_BUILD_DIR); $(MAKE) all run EL=$(EL) RL=$(RL) DL=$(DL) NI=$(NI) NR=$(NR) NC=$(NC) BW=$(BW) platform=gvsoc; fi

sim_trace:
	if [ -d $(BIG_BUILD_DIR) ]; then cd $(BIG_BUILD_DIR); $(MAKE) all run EL=$(EL) RL=$(RL) DL=$(DL) NI=$(NI) NR=$(NR) NC=$(NC) BW=$(BW)  platform=gvsoc runner_args="--trace=camera/trace:trace.txt"; fi

sim_trace_vcd:
	if [ -d $(BIG_BUILD_DIR) ]; then cd $(BIG_BUILD_DIR); $(MAKE) all run EL=$(EL) RL=$(RL) DL=$(DL) NI=$(NI) NR=$(NR) NC=$(NC) BW=$(BW)  platform=gvsoc runner_args="--trace=camera:camera_trace.txt --vcd --event=.*"; fi

sim_trace_all:
	if [ -d $(BIG_BUILD_DIR) ]; then cd $(BIG_BUILD_DIR); $(MAKE) all run EL=$(EL) RL=$(RL) DL=$(DL) NI=$(NI) NR=$(NR) NC=$(NC) BW=$(BW)  platform=gvsoc runner_args="--trace=.*:all_trace.txt"; fi
