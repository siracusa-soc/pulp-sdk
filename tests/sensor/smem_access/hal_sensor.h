/*
 * Copyright (C) 2018-2019 ETH Zurich and University of Bologna
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
 *           Renzo Andri <andrire@iis.ee.ethz.ch>
 */
#include <stdio.h>

#ifndef __HAL_SENSOR_H__
#define __HAL_SENSOR_H__

/* REGISTER MAP */

// global address map + event IDs
#define SENSOR_ADDR_BASE    0x00201c00
#define CLUS_CTRL_ADDR_BASE 0x00200000
#define SENSOR_EVT0           13
#define SENSOR_EVT1           14

// commands
#define SENSOR_COMMIT_AND_TRIGGER 0x00
#define SENSOR_ACQUIRE            0x04
#define SENSOR_FINISHED           0x08
#define SENSOR_STATUS             0x0c
#define SENSOR_RUNNING_JOB        0x10
#define SENSOR_SOFT_CLEAR         0x14
#define SENSOR_SWSYNC             0x18
#define SENSOR_URISCY_IMEM        0x1c

// job configuration
#define SENSOR_REGISTER_OFFS       0x20
#define SENSOR_REGISTER_CXT0_OFFS  0x80
#define SENSOR_REGISTER_CXT1_OFFS  0x120
#define SENSOR_REG_FPS              0x00
#define SENSOR_REG_ROWS             0x04
#define SENSOR_REG_COLS             0x08
#define SENSOR_REG_CHANNELS         0x0c
#define SENSOR_REG_BITS             0x10
#define SENSOR_REG_TYPE             0x14
#define SENSOR_REG_EXPOSURE_LATENCY 0x18
#define SENSOR_REG_RESET_LATENCY    0x1c
#define SENSOR_REG_READOUT_LATENCY  0x20
#define SENSOR_REG_ADCS             0x24
#define SENSOR_REG_TIME             0x28
#define SENSOR_REG_FRAMES           0x2c
#define SENSOR_REG_BASE1            0x30
#define SENSOR_REG_BASE2            0x34


#define SENSOR_SPECIAL_TRACE_REG 0x38
#define SENSOR_L0_JOB_START_END 0
#define SENSOR_L1_CONFIG        1
#define SENSOR_L2_ACTIV_INOUT   2
#define SENSOR_L3_ALL           3
#define SENSOR_STDOUT      4

// cluster controller register offset and bits
#define CLUS_CTRL_HWPE_OFFS              0x18
#define CLUS_CTRL_HWPE_CG_EN_MASK        0x800
#define CLUS_CTRL_HWPE_HCI_PRIO_MASK     0x100
#define CLUS_CTRL_HWPE_HCI_MAXSTALL_MASK 0xff

// others
#define SENSOR_COMMIT_CMD  1
#define SENSOR_TRIGGER_CMD 0
#define SENSOR_SOFT_CLEAR_ALL   0
#define SENSOR_SOFT_CLEAR_STATE 1

/* LOW-LEVEL HAL */
// For all the following functions we use __builtin_pulp_OffsetedWrite and __builtin_pulp_OffsetedRead
// instead of classic load/store because otherwise the compiler is not able to correctly factorize
// the SENSOR base in case several accesses are done, ending up with twice more code
#if defined(__riscv__) && !defined(RV_ISA_RV32)
  #define SENSOR_WRITE_CMD(offset, value)        __builtin_pulp_OffsetedWrite(value, (int volatile *)(SENSOR_ADDR_BASE), offset)
  #define SENSOR_WRITE_CMD_BE(offset, value, be) *(char volatile *)(SENSOR_ADDR_BASE + offset + be) = value
  // #define SENSOR_READ_CMD(offset)                (__builtin_pulp_OffsetedRead(*(int volatile *)(SENSOR_ADDR_BASE), offset))
  #define SENSOR_READ_CMD(ret, offset)           ret = (*(int volatile *)(SENSOR_ADDR_BASE + offset))

  #define SENSOR_WRITE_REG(offset, value)        __builtin_pulp_OffsetedWrite(value, (int volatile *)(SENSOR_ADDR_BASE + SENSOR_REGISTER_OFFS), offset)
  #define SENSOR_WRITE_REG_BE(offset, value, be) *(char volatile *)(SENSOR_ADDR_BASE + SENSOR_REGISTER_OFFS + offset + be) = value
  // #define SENSOR_READ_REG(offset)                (__builtin_pulp_OffsetedRead(*(int volatile *)(SENSOR_ADDR_BASE + SENSOR_REGISTER_OFFS), offset))
  #define SENSOR_READ_REG(ret, offset)           ret = (*(int volatile *)(SENSOR_ADDR_BASE + SENSOR_REGISTER_OFFS + offset))

  #define SENSOR_WRITE_REG_CXT0(offset, value)        __builtin_pulp_OffsetedWrite(value, (int volatile *)(SENSOR_ADDR_BASE + SENSOR_REGISTER_CXT0_OFFS), offset)
  #define SENSOR_WRITE_REG_CXT0_BE(offset, value, be) *(char volatile *)(SENSOR_ADDR_BASE + SENSOR_REGISTER_CXT0_OFFS + offset + be) = value
  #define SENSOR_READ_REG_CXT0(offset)                (__builtin_pulp_OffsetedRead(*(int volatile *)(SENSOR_ADDR_BASE + SENSOR_REGISTER_CXT0_OFFS), offset))

  #define SENSOR_WRITE_REG_CXT1(offset, value)        __builtin_pulp_OffsetedWrite(value, (int volatile *)(SENSOR_ADDR_BASE + SENSOR_REGISTER_CXT1_OFFS), offset)
  #define SENSOR_WRITE_REG_CXT1_BE(offset, value, be) *(char volatile *)(SENSOR_ADDR_BASE + SENSOR_REGISTER_CXT1_OFFS + offset + be) = value
  #define SENSOR_READ_REG_CXT1(offset)                (__builtin_pulp_OffsetedRead(*(int volatile *)(SENSOR_ADDR_BASE + SENSOR_REGISTER_CXT1_OFFS), offset))
#else
  #define SENSOR_WRITE_CMD(offset, value)        *(int volatile *)(SENSOR_ADDR_BASE + offset) = value
  #define SENSOR_WRITE_CMD_BE(offset, value, be) *(char volatile *)(SENSOR_ADDR_BASE + offset + be) = value
  #define SENSOR_READ_CMD(ret, offset)           ret = (*(int volatile *)(SENSOR_ADDR_BASE + offset))

  #define SENSOR_WRITE_REG(offset, value)        *(int volatile *)(SENSOR_ADDR_BASE + SENSOR_REGISTER_OFFS + offset) = value
  #define SENSOR_WRITE_REG_BE(offset, value, be) *(char volatile *)(SENSOR_ADDR_BASE + SENSOR_REGISTER_OFFS + offset + be) = value
  #define SENSOR_READ_REG(ret, offset)           ret = (*(int volatile *)(SENSOR_ADDR_BASE + SENSOR_REGISTER_OFFS + offset))

  #define SENSOR_WRITE_REG_CXT0(offset, value)        __builtin_pulp_OffsetedWrite(value, (int volatile *)(SENSOR_ADDR_BASE + SENSOR_REGISTER_CXT0_OFFS), offset)
  #define SENSOR_WRITE_REG_CXT0_BE(offset, value, be) *(char volatile *)(SENSOR_ADDR_BASE + SENSOR_REGISTER_CXT0_OFFS + offset + be) = value
  #define SENSOR_READ_REG_CXT0(offset)                (__builtin_pulp_OffsetedRead(*(int volatile *)(SENSOR_ADDR_BASE + SENSOR_REGISTER_CXT0_OFFS), offset))

  #define SENSOR_WRITE_REG_CXT1(offset, value)        __builtin_pulp_OffsetedWrite(value, (int volatile *)(SENSOR_ADDR_BASE + SENSOR_REGISTER_CXT1_OFFS), offset)
  #define SENSOR_WRITE_REG_CXT1_BE(offset, value, be) *(char volatile *)(SENSOR_ADDR_BASE + SENSOR_REGISTER_CXT1_OFFS + offset + be) = value
  #define SENSOR_READ_REG_CXT1(offset)                (__builtin_pulp_OffsetedRead(*(int volatile *)(SENSOR_ADDR_BASE + SENSOR_REGISTER_CXT1_OFFS), offset))
#endif

#define SENSOR_CG_ENABLE()  *(volatile int*) (CLUS_CTRL_ADDR_BASE + CLUS_CTRL_HWPE_OFFS) |=  CLUS_CTRL_HWPE_CG_EN_MASK
#define SENSOR_CG_DISABLE() *(volatile int*) (CLUS_CTRL_ADDR_BASE + CLUS_CTRL_HWPE_OFFS) &= ~CLUS_CTRL_HWPE_CG_EN_MASK

#define SENSOR_SETPRIORITY_CORE() *(volatile int*) (CLUS_CTRL_ADDR_BASE + CLUS_CTRL_HWPE_OFFS) &= ~CLUS_CTRL_HWPE_HCI_PRIO_MASK
#define SENSOR_SETPRIORITY_SENSOR() *(volatile int*) (CLUS_CTRL_ADDR_BASE + CLUS_CTRL_HWPE_OFFS) |=  CLUS_CTRL_HWPE_HCI_PRIO_MASK

#define SENSOR_RESET_MAXSTALL()  *(volatile int*) (CLUS_CTRL_ADDR_BASE + CLUS_CTRL_HWPE_OFFS) &= ~CLUS_CTRL_HWPE_HCI_MAXSTALL_MASK
#define SENSOR_SET_MAXSTALL(val) *(volatile int*) (CLUS_CTRL_ADDR_BASE + CLUS_CTRL_HWPE_OFFS) |=  (val & CLUS_CTRL_HWPE_HCI_MAXSTALL_MASK)

#define SENSOR_BARRIER_NOSTATUS()      eu_evt_maskWaitAndClr (1 << SENSOR_EVT0)
#define SENSOR_BARRIER()               do { eu_evt_maskWaitAndClr (1 << SENSOR_EVT0); } while((*(int volatile *)(SENSOR_ADDR_BASE + SENSOR_STATUS)) != 0)
#define SENSOR_BUSYWAIT()              do {                                         } while((*(int volatile *)(SENSOR_ADDR_BASE + SENSOR_STATUS)) != 0)
#define SENSOR_BARRIER_ACQUIRE(job_id) job_id = SENSOR_READ_CMD(job_id, SENSOR_ACQUIRE); \
                                     while(job_id < 0) { eu_evt_maskWaitAndClr (1 << SENSOR_EVT0); SENSOR_READ_CMD(job_id, SENSOR_ACQUIRE); };
/* UTILITY FUNCTIONS */

// int sensor_compare_int(uint32_t *actual_y, uint32_t *golden_y, int n_iters, int n_rows, int n_col_words, int N_FRAMES, int N_COLS, int N_ROWS) {
//   uint32_t actual_word = 0;
//   uint32_t golden_word = 0;
//   uint32_t actual = 0;
//   uint32_t golden = 0;
//   uint32_t* golden_addr;
//   uint32_t* actual_addr;
  
//   int errors = 0;
//   int non_zero_values = 0;

//   int count = 0;

//   for (int i=0; i<n_iters; i++) {
//     for(int j=0; j<n_rows; j++) {
//       for(int k=0; k<n_col_words; k++){
//           golden_addr = golden_y + (i*N_ROWS*N_COLS/4)+(j*N_COLS/4)+k;
//           actual_addr = actual_y + (i*n_rows*n_col_words)+(j*n_col_words)+k;
//           actual_word = *(actual_addr);
//           golden_word = *(golden_addr);
//           int error = (int) (actual_word != golden_word);
//           errors += (int) (actual_word != golden_word);
//           count++;
//           // printf(" Error 0x%08x <- 0x%08x @ 0x%08x @ 0x%08x\n", golden_word, actual_word, (actual_addr-actual_y), (golden_addr-golden_y));
//           if(error) {
//           if(errors==1) printf("  golden     <- actual     @ address    @ index\n");
//             printf(" Error 0x%08x <- 0x%08x @ 0x%08x @ 0x%08x\n", golden_word, actual_word, (actual_addr-actual_y), (golden_addr-golden_y));
//           }
//       }
//     }
//   }
//   // printf("Counter value=%d\n", count);
//   return errors;
// }

#endif /* __HAL_NEUREKA_H__ */
