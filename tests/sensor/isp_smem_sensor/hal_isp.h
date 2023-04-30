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

#ifndef __HAL_ISP_H__
#define __HAL_ISP_H__

/* REGISTER MAP */

// global address map + event IDs
#define ISP_ADDR_BASE    0x00202000
#define CLUS_CTRL_ADDR_BASE 0x00200000
#define ISP_EVT0           14
#define ISP_EVT1           15

// commands
#define ISP_COMMIT_AND_TRIGGER 0x00
#define ISP_ACQUIRE            0x04
#define ISP_FINISHED           0x08
#define ISP_STATUS             0x0c
#define ISP_RUNNING_JOB        0x10
#define ISP_SOFT_CLEAR         0x14
#define ISP_SWSYNC             0x18
#define ISP_URISCY_IMEM        0x1c

// job configuration
#define ISP_REGISTER_OFFS       0x20
#define ISP_REGISTER_CXT0_OFFS  0x100
#define ISP_REGISTER_CXT1_OFFS  0x200

#define ISP_REG_EXEC_LATENCY     0x00
#define ISP_REG_BASE             0x04

#define ISP_REG_ADC_D0_STRIDE    0x08
#define ISP_REG_ADC_D1_STRIDE    0x0c
#define ISP_REG_ADC_D2_STRIDE    0x10
#define ISP_REG_ROW_D0_STRIDE    0x14
#define ISP_REG_ROW_D1_STRIDE    0x18
#define ISP_REG_ROW_D2_STRIDE    0x1c
#define ISP_REG_FRAME_D0_STRIDE  0x20
#define ISP_REG_FRAME_D1_STRIDE  0x24
#define ISP_REG_FRAME_D2_STRIDE  0x28

#define ISP_REG_ADC_D0_LENGTH    0x2c
#define ISP_REG_ADC_D1_LENGTH    0x30
#define ISP_REG_ADC_D2_LENGTH    0x34
#define ISP_REG_ROW_D0_LENGTH    0x38
#define ISP_REG_ROW_D1_LENGTH    0x3c
#define ISP_REG_ROW_D2_LENGTH    0x40
#define ISP_REG_FRAME_D0_LENGTH  0x44
#define ISP_REG_FRAME_D1_LENGTH  0x48
#define ISP_REG_FRAME_D2_LENGTH  0x4c

#define ISP_REG_NB_ADCS          0x50
#define ISP_REG_NB_FRAMES        0x54


#define ISP_SPECIAL_TRACE_REG 0x58
#define ISP_L0_JOB_START_END 0
#define ISP_L1_CONFIG        1
#define ISP_L2_ACTIV_INOUT   2
#define ISP_L3_ALL           3
#define ISP_STDOUT           4

// cluster controller register offset and bits
#define CLUS_CTRL_HWPE_OFFS              0x18
#define CLUS_CTRL_HWPE_CG_EN_MASK        0x800
#define CLUS_CTRL_HWPE_HCI_PRIO_MASK     0x100
#define CLUS_CTRL_HWPE_HCI_MAXSTALL_MASK 0xff

// others
#define ISP_COMMIT_CMD  1
#define ISP_TRIGGER_CMD 0
#define ISP_SOFT_CLEAR_ALL   0
#define ISP_SOFT_CLEAR_STATE 1

/* LOW-LEVEL HAL */
// For all the following functions we use __builtin_pulp_OffsetedWrite and __builtin_pulp_OffsetedRead
// instead of classic load/store because otherwise the compiler is not able to correctly factorize
// the ISP base in case several accesses are done, ending up with twice more code
#if defined(__riscv__) && !defined(RV_ISA_RV32)
  #define ISP_WRITE_CMD(offset, value)        __builtin_pulp_OffsetedWrite(value, (int volatile *)(ISP_ADDR_BASE), offset)
  #define ISP_WRITE_CMD_BE(offset, value, be) *(char volatile *)(ISP_ADDR_BASE + offset + be) = value
  // #define ISP_READ_CMD(offset)                (__builtin_pulp_OffsetedRead(*(int volatile *)(ISP_ADDR_BASE), offset))
  #define ISP_READ_CMD(ret, offset)           ret = (*(int volatile *)(ISP_ADDR_BASE + offset))

  #define ISP_WRITE_REG(offset, value)        __builtin_pulp_OffsetedWrite(value, (int volatile *)(ISP_ADDR_BASE + ISP_REGISTER_OFFS), offset)
  #define ISP_WRITE_REG_BE(offset, value, be) *(char volatile *)(ISP_ADDR_BASE + ISP_REGISTER_OFFS + offset + be) = value
  // #define ISP_READ_REG(offset)                (__builtin_pulp_OffsetedRead(*(int volatile *)(ISP_ADDR_BASE + ISP_REGISTER_OFFS), offset))
  #define ISP_READ_REG(ret, offset)           ret = (*(int volatile *)(ISP_ADDR_BASE + ISP_REGISTER_OFFS + offset))

  #define ISP_WRITE_REG_CXT0(offset, value)        __builtin_pulp_OffsetedWrite(value, (int volatile *)(ISP_ADDR_BASE + ISP_REGISTER_CXT0_OFFS), offset)
  #define ISP_WRITE_REG_CXT0_BE(offset, value, be) *(char volatile *)(ISP_ADDR_BASE + ISP_REGISTER_CXT0_OFFS + offset + be) = value
  #define ISP_READ_REG_CXT0(offset)                (__builtin_pulp_OffsetedRead(*(int volatile *)(ISP_ADDR_BASE + ISP_REGISTER_CXT0_OFFS), offset))

  #define ISP_WRITE_REG_CXT1(offset, value)        __builtin_pulp_OffsetedWrite(value, (int volatile *)(ISP_ADDR_BASE + ISP_REGISTER_CXT1_OFFS), offset)
  #define ISP_WRITE_REG_CXT1_BE(offset, value, be) *(char volatile *)(ISP_ADDR_BASE + ISP_REGISTER_CXT1_OFFS + offset + be) = value
  #define ISP_READ_REG_CXT1(offset)                (__builtin_pulp_OffsetedRead(*(int volatile *)(ISP_ADDR_BASE + ISP_REGISTER_CXT1_OFFS), offset))
#else
  #define ISP_WRITE_CMD(offset, value)        *(int volatile *)(ISP_ADDR_BASE + offset) = value
  #define ISP_WRITE_CMD_BE(offset, value, be) *(char volatile *)(ISP_ADDR_BASE + offset + be) = value
  #define ISP_READ_CMD(ret, offset)           ret = (*(int volatile *)(ISP_ADDR_BASE + offset))

  #define ISP_WRITE_REG(offset, value)        *(int volatile *)(ISP_ADDR_BASE + ISP_REGISTER_OFFS + offset) = value
  #define ISP_WRITE_REG_BE(offset, value, be) *(char volatile *)(ISP_ADDR_BASE + ISP_REGISTER_OFFS + offset + be) = value
  #define ISP_READ_REG(ret, offset)           ret = (*(int volatile *)(ISP_ADDR_BASE + ISP_REGISTER_OFFS + offset))

  #define ISP_WRITE_REG_CXT0(offset, value)        __builtin_pulp_OffsetedWrite(value, (int volatile *)(ISP_ADDR_BASE + ISP_REGISTER_CXT0_OFFS), offset)
  #define ISP_WRITE_REG_CXT0_BE(offset, value, be) *(char volatile *)(ISP_ADDR_BASE + ISP_REGISTER_CXT0_OFFS + offset + be) = value
  #define ISP_READ_REG_CXT0(offset)                (__builtin_pulp_OffsetedRead(*(int volatile *)(ISP_ADDR_BASE + ISP_REGISTER_CXT0_OFFS), offset))

  #define ISP_WRITE_REG_CXT1(offset, value)        __builtin_pulp_OffsetedWrite(value, (int volatile *)(ISP_ADDR_BASE + ISP_REGISTER_CXT1_OFFS), offset)
  #define ISP_WRITE_REG_CXT1_BE(offset, value, be) *(char volatile *)(ISP_ADDR_BASE + ISP_REGISTER_CXT1_OFFS + offset + be) = value
  #define ISP_READ_REG_CXT1(offset)                (__builtin_pulp_OffsetedRead(*(int volatile *)(ISP_ADDR_BASE + ISP_REGISTER_CXT1_OFFS), offset))
#endif

#define ISP_CG_ENABLE()  *(volatile int*) (CLUS_CTRL_ADDR_BASE + CLUS_CTRL_HWPE_OFFS) |=  CLUS_CTRL_HWPE_CG_EN_MASK
#define ISP_CG_DISABLE() *(volatile int*) (CLUS_CTRL_ADDR_BASE + CLUS_CTRL_HWPE_OFFS) &= ~CLUS_CTRL_HWPE_CG_EN_MASK

#define ISP_SETPRIORITY_CORE() *(volatile int*) (CLUS_CTRL_ADDR_BASE + CLUS_CTRL_HWPE_OFFS) &= ~CLUS_CTRL_HWPE_HCI_PRIO_MASK
#define ISP_SETPRIORITY_ISP() *(volatile int*) (CLUS_CTRL_ADDR_BASE + CLUS_CTRL_HWPE_OFFS) |=  CLUS_CTRL_HWPE_HCI_PRIO_MASK

#define ISP_RESET_MAXSTALL()  *(volatile int*) (CLUS_CTRL_ADDR_BASE + CLUS_CTRL_HWPE_OFFS) &= ~CLUS_CTRL_HWPE_HCI_MAXSTALL_MASK
#define ISP_SET_MAXSTALL(val) *(volatile int*) (CLUS_CTRL_ADDR_BASE + CLUS_CTRL_HWPE_OFFS) |=  (val & CLUS_CTRL_HWPE_HCI_MAXSTALL_MASK)

#define ISP_BARRIER_NOSTATUS()      eu_evt_maskWaitAndClr (1 << ISP_EVT0)
#define ISP_BARRIER()               do { eu_evt_maskWaitAndClr (1 << ISP_EVT0); } while((*(int volatile *)(ISP_ADDR_BASE + ISP_STATUS)) != 0)
#define ISP_BUSYWAIT()              do {                                         } while((*(int volatile *)(ISP_ADDR_BASE + ISP_STATUS)) != 0)
#define ISP_BARRIER_ACQUIRE(job_id) job_id = ISP_READ_CMD(job_id, ISP_ACQUIRE); \
                                     while(job_id < 0) { eu_evt_maskWaitAndClr (1 << ISP_EVT0); ISP_READ_CMD(job_id, ISP_ACQUIRE); };
/* UTILITY FUNCTIONS */

// int isp_compare_int(uint32_t *actual_y, uint32_t *golden_y, int n_iters, int n_rows, int n_col_words, int N_FRAMES, int N_COLS, int N_ROWS) {
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
