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
void pe_entry0(void *arg)
{   
    volatile int myid = pi_core_id();
    for(volatile int i=0; i<(myid+1)*15000+10*15000*pi_cluster_id(); i++){
        asm("nop");
    }

    printf("Hello from cluster=%d, core=%d\n\r", pi_cluster_id(), pi_core_id());

}

void pe_entry1(void *arg)
{   
    volatile int myid = pi_core_id();
    for(volatile int i=0; i<(myid+1)*15000 + 10*15000*pi_cluster_id(); i++){
        asm("nop");
    }

    printf("Hello from cluster=%d, core=%d\n\r", pi_cluster_id(), pi_core_id());

}

void pe_entry2(void *arg)
{   
    volatile int myid = pi_core_id();
    for(volatile int i=0; i<(myid+1)*15000+10*15000*pi_cluster_id(); i++){
        asm("nop");
    }

    printf("Hello from cluster=%d, core=%d\n\r", pi_cluster_id(), pi_core_id());

}

void pe_entry3(void *arg)
{   
    volatile int myid = pi_core_id();
    for(volatile int i=0; i<(myid+1)*15000+10*15000*pi_cluster_id(); i++){
        asm("nop");
    }

    printf("Hello from cluster=%d, core=%d\n\r", pi_cluster_id(), pi_core_id());

}

void cluster_entry0(void *arg)
{
    int ncores=pi_cl_team_nb_cores();   

    pi_cl_team_fork((NUM_CORES), pe_entry0, 0);
}

void cluster_entry1(void *arg)
{
    int ncores=pi_cl_team_nb_cores();   

    pi_cl_team_fork((NUM_CORES), pe_entry1, 0);
}
void cluster_entry2(void *arg)
{
    int ncores=pi_cl_team_nb_cores();   

    pi_cl_team_fork((NUM_CORES), pe_entry2, 0);
}
void cluster_entry3(void *arg)
{
    int ncores=pi_cl_team_nb_cores();   

    pi_cl_team_fork((NUM_CORES), pe_entry3, 0);
}
#endif

#define N_CLUSTER 4
static int test_entry()
{
#if defined(CLUSTER)
    struct pi_device cluster_dev[4];
    struct pi_cluster_conf cl_conf[4];
    struct pi_cluster_task cl_task[4];

    pi_task_t task[4];

    for(int i=0; i<N_CLUSTER; i++)
    {
        pi_cluster_conf_init(&cl_conf[i]);
        cl_conf[i].id = i;

        pi_open_from_conf(&cluster_dev[i], &cl_conf[i]);
        pi_cluster_open(&cluster_dev[i]);
    }

    pi_cluster_task(&cl_task[0], cluster_entry0, NULL);
    pi_cluster_task(&cl_task[1], cluster_entry1, NULL);
    pi_cluster_task(&cl_task[2], cluster_entry2, NULL);
    pi_cluster_task(&cl_task[3], cluster_entry3, NULL);

    for(int i=0; i<N_CLUSTER; i++)
    {
        pi_cluster_send_task_to_cl_async(&cluster_dev[i], &cl_task[i], pi_task_block(&task[i]));
    }

    pi_task_wait_on(&task[0]);
    pi_task_wait_on(&task[1]);
    pi_task_wait_on(&task[2]);
    pi_task_wait_on(&task[3]);


    for(int i=0; i<N_CLUSTER; i++)
    {
        pi_cluster_close(&cluster_dev[i]);
    }
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