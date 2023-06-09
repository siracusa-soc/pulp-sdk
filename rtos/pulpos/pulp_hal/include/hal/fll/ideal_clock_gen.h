/*
 * Copyright (C) 2018 ETH Zurich and University of Bologna
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

#ifndef __HAL_FLL_IDEAL_CLOCK_GEN_H__
#define __HAL_FLL_IDEAL_CLOCK_GEN_H__

#include "hal/pulp.h"
#include "archi/fll/ideal_clock_gen.h"
#include "hal/pulp_io.h"


static inline void hal_fll_ideal_clock_gen_set_freq(int fll, int frequency)
{
   pulp_write32((ARCHI_FLL_ADDR) + FLL_FREQUENCY_OFFSET + (fll*(ARCHI_FLL_AREA_SIZE)), frequency);
}


#endif
