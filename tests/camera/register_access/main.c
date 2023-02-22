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

int glob_errors=0;

int run_test() {
    CAMERA_WRITE_REG(CAMERA_REG_FRAMES           , 0x00);
    CAMERA_WRITE_REG(CAMERA_REG_ROWS             , 0x04);
    CAMERA_WRITE_REG(CAMERA_REG_COLS             , 0x08);
    CAMERA_WRITE_REG(CAMERA_REG_CHANNELS         , 0x0c);
    CAMERA_WRITE_REG(CAMERA_REG_BITS             , 0x10);
    CAMERA_WRITE_REG(CAMERA_REG_ITERS            , 0x14);
    CAMERA_WRITE_REG(CAMERA_REG_CAMERA_TYPE      , 0x18);
    CAMERA_WRITE_REG(CAMERA_REG_EXPOSURE_LATENCY , 0x1c);
    CAMERA_WRITE_REG(CAMERA_REG_RESET_LATENCY    , 0x20);
    CAMERA_WRITE_REG(CAMERA_REG_READOUT_LATENCY  , 0x24);
    CAMERA_WRITE_REG(CAMERA_REG_ADC_LATENCY      , 0x28);
    CAMERA_WRITE_REG(CAMERA_REG_ADC_COUNT        , 0x2c);
    CAMERA_WRITE_REG(CAMERA_REG_RANDOM_SEED      , 0x30);
    CAMERA_WRITE_REG(CAMERA_REG_GEN_RANDOM       , 0x34);


    CAMERA_WRITE_REG(CAMERA_SPECIAL_TRACE_REG, CAMERA_L3_ALL);

    CAMERA_WRITE_CMD(CAMERA_COMMIT_AND_TRIGGER, CAMERA_TRIGGER_CMD);

  return 0;
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
  int ret = test_entry();
  pmsis_exit(ret);
}

int main() {
  return pmsis_kickoff((void *)test_kickoff);
}
