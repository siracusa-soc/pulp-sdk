/*
 * Copyright (C) 2022 ETH Zurich and University of Bologna
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
 * Authors:  Nazareno Bruschi, UniBo (<nazareno.bruschi@unibo.it>)
 */


#include "pmsis.h"



PI_FC_TINY int pos_fll_freq[ARCHI_NB_FLL];

static PI_FC_TINY char pos_fll_is_on[ARCHI_NB_FLL];



unsigned int pos_fll_set_freq(int fll, unsigned int frequency)
{
  FREQ_TRACE(POS_LOG_INFO, "Setting FLL frequency (fll: %d, frequency: %d MHz)\n", fll, frequency);

  pos_fll_freq[fll] = frequency;

  if (pos_fll_is_on[fll])
  {
    hal_fll_ideal_clock_gen_set_freq(fll, frequency);
  }

  return frequency;
}



// This function should be placed in standard L2 location, not XIP, as it will change FLL frequency
// and adapt boot device divider
POS_TEXT_L2 unsigned int pos_fll_init(int fll, int frequency)
{
  FREQ_TRACE(POS_LOG_INFO, "Initializing FLL (fll: %d)\n", fll);

  pos_fll_is_on[fll] = 1;
  pos_fll_freq[fll] = frequency;

  return frequency;
}



void pos_fll_deinit(int fll)
{
    // Just remember the FLL is off. Keep the same frequency so that we can restore the FLL
    // with the same frequency later on
    pos_fll_is_on[fll] = 0;
}



void pos_fll_constructor()
{
    for (int i=0; i<ARCHI_NB_FLL; i++)
    {
        pos_fll_freq[i] = 0;
        pos_fll_is_on[i] = 0;
    }
}
