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

#if defined(CLUSTER)
void pe_entry(void *arg)
{   
    volatile int myid = pi_core_id();
    for(volatile int i=0; i<(myid+1)*15000; i++){
        asm("nop");
    }

    printf("Hello from cluster=%d, core=%d\n\r", pi_cluster_id(), pi_core_id());

}

void cluster_entry(void *arg)
{
    int ncores=pi_cl_team_nb_cores();   

    pi_cl_team_fork((NUM_CORES), pe_entry, 0);
}
#endif

static int test_entry()
{
#if defined(CLUSTER)
    struct pi_device cluster_dev;
    struct pi_cluster_conf cl_conf;
    struct pi_cluster_task cl_task;

    pi_cluster_conf_init(&cl_conf);
    pi_open_from_conf(&cluster_dev, &cl_conf);
    if (pi_cluster_open(&cluster_dev))
    {
        return -1;
    }

    pi_cluster_send_task_to_cl(&cluster_dev, pi_cluster_task(&cl_task, cluster_entry, NULL));

    pi_cluster_close(&cluster_dev);
#endif
#if !defined(CLUSTER)
    printf("Hello from FC\n");
#endif

    return 0;
}

static void test_kickoff(void *arg)
{
    int ret = test_entry();
    pmsis_exit(ret);
}

int main()
{
    #if defined(RTL_PLATFORM)
        padctrl_mode_set(PAD_GPIO32, PAD_MODE_UART0_RX);
        padctrl_mode_set(PAD_GPIO33, PAD_MODE_UART0_TX);
    #endif
    return pmsis_kickoff((void *)test_kickoff);
}