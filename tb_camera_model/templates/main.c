/*
 * Copyright (C) 2020 ETH Zurich, University of Bologna and GreenWaves Technologies
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/*
 * Authors:  Francesco Conti <fconti@iis.ee.ethz.ch>
 *           Gianna Paulin <pauling@iis.ee.ethz.ch>
 *           Renzo Andri <andrire@iis.ee.ethz.ch>
 * Main Test Program for the CAMERA
 */

#include "pmsis.h"
#include "pmsis/cluster/dma/cl_dma.h"
#include <stdint.h>
#include <stdio.h>

#include "hal_camera.h"
#include "golden_data.h"

int glob_errors=0;

// #define WR_BASE_ADDRESS 0x00001000
#define WR_BASE_ADDRESS 0x11000000

#define MAX_N_FRAMES 10
#define MAX_N_ROWS 400
#define MAX_N_COLS 400
#define MAX_N_CHANNELS 1

int run_test() {
  int ret=0xff;
    CAMERA_WRITE_REG(CAMERA_REG_FRAMES           , 0x00);
    CAMERA_WRITE_REG(CAMERA_REG_ROWS             , CFG_N_ROWS);
    CAMERA_WRITE_REG(CAMERA_REG_COLS             , CFG_N_COLS);
    CAMERA_WRITE_REG(CAMERA_REG_CHANNELS         , 0x01);
    CAMERA_WRITE_REG(CAMERA_REG_ITERS            , CFG_N_ITERS);
    CAMERA_WRITE_REG(CAMERA_REG_WRITE_ADDRESS    , WR_BASE_ADDRESS);
    CAMERA_WRITE_REG(CAMERA_REG_EXPOSURE_LATENCY , EXPOSURE_LATENCY);
    CAMERA_WRITE_REG(CAMERA_REG_RESET_LATENCY    , RESET_LATENCY);
    CAMERA_WRITE_REG(CAMERA_REG_READOUT_LATENCY  , READOUT_LATENCY);
    CAMERA_WRITE_REG(CAMERA_REG_BANDWIDTH        , CFG_BANDWIDTH);


    CAMERA_WRITE_REG(CAMERA_SPECIAL_TRACE_REG, CAMERA_L3_ALL);

    CAMERA_WRITE_CMD(CAMERA_COMMIT_AND_TRIGGER, CAMERA_TRIGGER_CMD);

    CAMERA_BARRIER();
    ret = camera_compare_int(WR_BASE_ADDRESS, golden_data , CFG_N_ITERS+1, CFG_N_ROWS, CFG_N_COLS/4, MAX_N_FRAMES, MAX_N_COLS, MAX_N_ROWS) ;

  return ret;
}

static struct pi_cluster_task task[1];
static struct pi_task events[1];

static void pe_entry(void *arg) {
  if(pi_core_id() == 0) {
    glob_errors = run_test();
  }
  pi_cl_team_barrier();
}

static void cluster_entry(void *arg) {
  pi_cl_team_fork(0, pe_entry, 0);
}

static int launch_cluster_task() {
  struct pi_device cluster_dev;
  struct pi_cluster_conf conf;
  struct pi_cluster_task task;

  pi_cluster_conf_init(&conf);
  conf.id = 0;
  glob_errors = 0;

  pi_open_from_conf(&cluster_dev, &conf);
  pi_cluster_open(&cluster_dev);

  pi_cluster_task(&task, cluster_entry, NULL);
  pi_cluster_send_task_to_cl(&cluster_dev, &task);
  pi_cluster_close(&cluster_dev);

  return glob_errors;
}

int test_entry() {

  volatile int errors = launch_cluster_task();
  if (errors)
    printf("Test failure\n");
  else
    printf("Test success\n");
  return errors;
}

void test_kickoff(void *arg) {
  int* cmem_addr;
  int ret = test_entry();
  
  pmsis_exit(ret);
}

int main() {
  return pmsis_kickoff((void *)test_kickoff);
}
