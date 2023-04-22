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
 * Main Test Program for the SENSOR
 */

#include "pmsis.h"
#include "pmsis/cluster/dma/cl_dma.h"
#include <stdint.h>
#include <stdio.h>

#include "hal_sensor.h"
// #include "golden_data.h"

int glob_errors=0;

#define ADC_D0_LENGTH   32
#define ADC_D1_LENGTH   15
#define ADC_D2_LENGTH   1
#define ROW_D0_LENGTH   4
#define ROW_D1_LENGTH   8
#define ROW_D2_LENGTH   20
#define FRAME_D0_LENGTH 2 
#define FRAME_D1_LENGTH 3 
#define FRAME_D2_LENGTH 2 


#define ADC_D0_STRIDE    1
#define ADC_D1_STRIDE    32
#define ADC_D2_STRIDE    0
#define ROW_D0_STRIDE    32*15*1
#define ROW_D1_STRIDE    32*15*1*4
#define ROW_D2_STRIDE    32*15*1*4*8
#define FRAME_D0_STRIDE  32*15*1*4*8*20
#define FRAME_D1_STRIDE  32*15*1*4*8*20*2
#define FRAME_D2_STRIDE  32*15*1*4*8*20*2*3


int run_test() {
  int ret=0x00;
  SENSOR_WRITE_REG(SENSOR_REG_ADC_STRIDE              ,N_ADCS);
  SENSOR_WRITE_REG(SENSOR_REG_ROWS             ,V_RESOLUTION);
  SENSOR_WRITE_REG(SENSOR_REG_COLS             ,H_RESOLUTION);
  SENSOR_WRITE_REG(SENSOR_REG_FRAMES           ,N_FRAMES);

  SENSOR_WRITE_REG(SENSOR_REG_ROW_STRIDE         ,0);
  SENSOR_WRITE_REG(SENSOR_REG_BITS               ,8);
  SENSOR_WRITE_REG(SENSOR_REG_TYPE             ,SENSOR_TYPE);

  SENSOR_WRITE_REG(SENSOR_REG_EXPOSURE_LATENCY ,EXPOSURE_LATENCY);
  SENSOR_WRITE_REG(SENSOR_REG_RESET_LATENCY    ,RESET_LATENCY);
  SENSOR_WRITE_REG(SENSOR_REG_READOUT_LATENCY  ,READOUT_LATENCY);
  
  SENSOR_WRITE_REG(SENSOR_REG_ADCS             ,N_ADCS);
  SENSOR_WRITE_REG(SENSOR_REG_FRAME_STRIDE             ,0x4000000);
  

  SENSOR_WRITE_REG(SENSOR_REG_BASE1            ,BUFFER1_ADDR);
  SENSOR_WRITE_REG(SENSOR_REG_BASE2            ,BUFFER2_ADDR);

  SENSOR_WRITE_REG(SENSOR_REG_ADC_D0_STRIDE  ,  ADC_D0_STRIDE  );
  SENSOR_WRITE_REG(SENSOR_REG_ADC_D1_STRIDE  ,  ADC_D1_STRIDE  );
  SENSOR_WRITE_REG(SENSOR_REG_ADC_D2_STRIDE  ,  ADC_D2_STRIDE  );
  SENSOR_WRITE_REG(SENSOR_REG_ROW_D0_STRIDE  ,  ROW_D0_STRIDE  );
  SENSOR_WRITE_REG(SENSOR_REG_ROW_D1_STRIDE  ,  ROW_D1_STRIDE  );
  SENSOR_WRITE_REG(SENSOR_REG_ROW_D2_STRIDE  ,  ROW_D2_STRIDE  );
  SENSOR_WRITE_REG(SENSOR_REG_FRAME_D0_STRIDE,  FRAME_D0_STRIDE);
  SENSOR_WRITE_REG(SENSOR_REG_FRAME_D1_STRIDE,  FRAME_D1_STRIDE);
  SENSOR_WRITE_REG(SENSOR_REG_FRAME_D2_STRIDE,  FRAME_D2_STRIDE);
  SENSOR_WRITE_REG(SENSOR_REG_ADC_D0_LENGTH  ,  ADC_D0_LENGTH  );
  SENSOR_WRITE_REG(SENSOR_REG_ADC_D1_LENGTH  ,  ADC_D1_LENGTH  );
  SENSOR_WRITE_REG(SENSOR_REG_ADC_D2_LENGTH  ,  ADC_D2_LENGTH  );
  SENSOR_WRITE_REG(SENSOR_REG_ROW_D0_LENGTH  ,  ROW_D0_LENGTH  );
  SENSOR_WRITE_REG(SENSOR_REG_ROW_D1_LENGTH  ,  ROW_D1_LENGTH  );
  SENSOR_WRITE_REG(SENSOR_REG_ROW_D2_LENGTH  ,  ROW_D2_LENGTH  );
  SENSOR_WRITE_REG(SENSOR_REG_FRAME_D0_LENGTH,  FRAME_D0_LENGTH);
  SENSOR_WRITE_REG(SENSOR_REG_FRAME_D1_LENGTH,  FRAME_D1_LENGTH);
  SENSOR_WRITE_REG(SENSOR_REG_FRAME_D2_LENGTH,  FRAME_D2_LENGTH);

  SENSOR_WRITE_REG(SENSOR_SPECIAL_TRACE_REG, SENSOR_L3_ALL);
  SENSOR_WRITE_CMD(SENSOR_COMMIT_AND_TRIGGER, SENSOR_TRIGGER_CMD);
  
  SENSOR_BARRIER() ;
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
