/* 
 * Copyright (C) 2017 ETH Zurich, University of Bologna and GreenWaves Technologies
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 * Authors: Germain Haugou, ETH (germain.haugou@iis.ee.ethz.ch)
 */

#include "pmsis.h"
#include "pmsis/cluster/cluster_team/cl_team.h"
#if defined(RTL_PLATFORM)
    #include "siracusa_padctrl.h"
#endif


PI_CL_L1_TINY int *array_pe_id;
PI_L2         int *array_fc_id;

#define ARCHI_NB_CLUSTER_IN_USE 2

struct pi_device cluster_dev[ARCHI_NB_CLUSTER_IN_USE];
struct pi_cluster_conf cl_conf[ARCHI_NB_CLUSTER_IN_USE];
struct pi_cluster_task cl_task[ARCHI_NB_CLUSTER_IN_USE];
struct pi_task events[ARCHI_NB_CLUSTER_IN_USE];

void pe_entry()
{
  printf("Hello from cluster_id: %d, core_id: %d\n", pi_cluster_id(), pi_core_id());
  //printf("Hello from cluster_id: , core_id: \n");

  array_pe_id[pi_core_id()] = pi_core_id();
}

void cluster_entry(void *arg)
{
  int *ret_val = (int *)arg;

  array_pe_id = pi_l1_malloc(&cluster_dev[pi_cluster_id()], (unsigned int)(ARCHI_CLUSTER_NB_PE)*sizeof(int));

  pi_cl_team_fork(ARCHI_CLUSTER_NB_PE, pe_entry, NULL);

  printf("[%d][%d]: Array address: %p\n", pi_cluster_id(), pi_core_id(), array_pe_id);
  //printf("[%d]: Array address: %p\n", pi_cluster_id(), array_pe_id);
  //printf("Array address: \n");

  int sum = 0;
  int check = 0;

  for(int i=0; i<ARCHI_CLUSTER_NB_PE; i++)
  {
    check += i;
    sum += array_pe_id[i];
  }

  pi_l1_free(&cluster_dev[pi_cluster_id()], array_pe_id, (unsigned int)(ARCHI_CLUSTER_NB_PE)*sizeof(int));

  if(sum != check)
  {
    printf("[%d]: ERROR: %d instead of %d\n", pi_cluster_id(), sum, check);
    
    *ret_val = -1;
  }
  else
  {
    *ret_val = 0;
  }
}


static int test_entry()
{
  printf("Starting test: nb_clusters = %d\n", ARCHI_NB_CLUSTER_IN_USE);
  int ret[ARCHI_NB_CLUSTER_IN_USE];
  int real_ret              = 0;

  array_fc_id = pi_l2_malloc(sizeof(int));
  if(array_fc_id == NULL)
  {
    return -1;
  }

  array_fc_id[0] = 0;

  printf("[%d]: Array address: %p\n", pi_cluster_id(), array_fc_id);


  pi_l2_free(array_fc_id, sizeof(int));

  for(int i = 0; i < ARCHI_NB_CLUSTER_IN_USE; i++)
  {
    pi_cluster_conf_init(&cl_conf[i]);
    cl_conf[i].id = i;
  }

  for(int i = 0; i < ARCHI_NB_CLUSTER_IN_USE; i++)
  {
    pi_open_from_conf(&cluster_dev[i], &cl_conf[i]);
  }

  for(int i = 0; i < ARCHI_NB_CLUSTER_IN_USE; i++)
  {
    if (pi_cluster_open(&cluster_dev[i]))
    {
      return -(i + 2);
    }
    pi_cluster_task(&cl_task[i], cluster_entry, (void *)&ret[i]);
  }

  for (int i = 0; i < ARCHI_NB_CLUSTER_IN_USE; i++)
  {
    pi_cluster_send_task_to_cl_async(&cluster_dev[i], &cl_task[i], pi_task_block(&events[i]));
  }

  for (int i = 0; i < ARCHI_NB_CLUSTER_IN_USE; i++)
  {
    pi_task_wait_on(&events[i]);
  }

  for (int i = 0; i < ARCHI_NB_CLUSTER_IN_USE; i++)
  {
    pi_cluster_close(&cluster_dev[i]);
  }

  real_ret = ret[0];
  for (int i = 1; i < ARCHI_NB_CLUSTER_IN_USE; i++)
  {
    real_ret += ret[i];
  }

  return real_ret;
}

static void test_kickoff(void *arg)
{
  int ret = test_entry();
  pmsis_exit(ret);
}

int main()
{
  return pmsis_kickoff((void *)test_kickoff);
}
