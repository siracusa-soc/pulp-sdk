/*
 * Copyright (C) 2020 GreenWaves Technologies
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

#ifndef __PI_CHIPS_GAP9_PMU_H__
#define __PI_CHIPS_GAP9_PMU_H__

#ifdef __cplusplus
extern "C" {
#endif

/**
 * \ingroup groupChips
 */

/**
 * \addtogroup GAP9
 * @{
 */

/**
 * \defgroup GAP9_PMU GAP9 PMU
 *
 * This part enumerates GAP9 power domains.
 *
 * \addtogroup GAP9_PMU
 * \{
 */

/**
 * \enum pi_pmu_domain_e
 *
 * \brief PMU domains.
 *
 * This is used to identify power domains on GAP9.
 */
typedef enum
{
    PI_PMU_DOMAIN_SOC    = 0,   /*!< SOC power domain. */
    PI_PMU_DOMAIN_CL     = 1,   /*!< Cluster power domain. */
    PI_PMU_DOMAIN_CSI    = 2,   /*!< CSI power domain. */
    PI_PMU_DOMAIN_MRAM   = 3,   /*!< MRAM power domain. */
    PI_PMU_DOMAIN_SFU    = 4    /*!< SFU power domain. */
} pi_pmu_domain_e;

/**
 * \cond IMPLEM
 */

/**
 * \endcond IMPLEM
 */

/**
 * \}
 */

/**
 * \}
 */

#ifdef __cplusplus
}
#endif
#endif  /* __PI_CHIPS_GAP9_PMU_H__ */
