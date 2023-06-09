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

#ifndef __PMSIS_DRIVERS_AES_H__
#define __PMSIS_DRIVERS_AES_H__

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif


/**
 * \ingroup groupDrivers
 *
 * \defgroup AES AES
 *
 * \brief AES Library.
 *
 * The AES API provides support for encryption and decryption.
 *
 * To use a UDMA FIFO with the AES, give the FIFO ID as source
 * and/or destination address. If you use a FIFO as destination,
 * you will need to manually stop the FIFO mode when you are done
 * using it with an ioctl command.
 *
 * \addtogroup AES
 * @{
 */

/**
 * \brief AES block ciphers modes
 */
typedef enum {
    PI_AES_MODE_ECB = 0,
    PI_AES_MODE_CBC = 1
} pi_aes_mode_e;

/**
 * \brief AES key lengths
 */
typedef enum {
    PI_AES_KEY_128 = 0,
    PI_AES_KEY_256 = 1
} pi_aes_key_len_e;

/**
 * \struct pi_aes_conf
 *
 * \brief structure describing the configuration of an AES device
 */
typedef struct pi_aes_conf
{
    uint8_t          itf;     /*!< AES device ID. */
    pi_aes_mode_e    mode;    /*!< AES mode */
    pi_aes_key_len_e key_len; /*!< AES key length: 128 or 256 bits */
    uint32_t*        key;     /*!< AES key */
    uint32_t*        iv;      /*!< initialization vector (only useful in CBC mode)*/
} pi_aes_conf_t;

/**
 * \enum pi_aes_ioctl_e
 *
 * \brief Commands for pi_aes_ioctl.
 *
 * This is used to tell which command to execute through pi_aes_ioctl.
 * Parameters are passed as pointers.
 */
typedef enum {
    /**
     * \brief stop FIFO mode/resume normal mode
     *
     * When a fifo is used as output of the AES, you need to send this
     * command to resume normal mode.
     */
    PI_AES_STOP_FIFO_MODE,
} pi_aes_ioctl_e;

/**
 * \brief initialize the configuration with default values
 *
 * \param conf the configuration to initialize
 */
void pi_aes_conf_init(struct pi_aes_conf* conf);

/**
 * \brief open an AES device
 *
 * \param device the AES device
 *
 * \return 0 if successful, else -1
 */
int pi_aes_open(struct pi_device* device);

/**
 * \brief close the device
 *
 * \param device the AES device
 */
void pi_aes_close(struct pi_device* device);

/**
 * \brief AES IOCTL function
 *
 * \param device A pi device structure pointing to AES device
 * \param cmd ioctl number
 * \param arg argument to be passed to ioctl
 */
void pi_aes_ioctl(pi_device_t *device, uint32_t cmd, void *arg);

/**
 * \brief encrypt data
 *
 * \param device the AES device
 * \param src data to encrypt
 * \param dest encrypted data
 * \param len length of the data in block (4 bytes)
 *
 * \warning source data length (in bytes) should be a multiple of 16
 *          user needs to handle padding if needed
 */
int pi_aes_encrypt(struct pi_device* device, void* src, void* dest, uint16_t len);

/**
 * \brief encrypt data and then execute specified task
 *
 * \param device the AES device
 * \param src data to encrypt
 * \param dest encrypted data
 * \param len length of the data in block (4 bytes)
 * \param task the task executed after the encryption
 *
 * \warning source data length (in bytes) should be a multiple of 16
 *          user needs to handle padding if needed
 */
int pi_aes_encrypt_async(struct pi_device* device, void* src, void* dest, uint16_t len, struct pi_task* task);

/**
 * \brief decrypt data
 *
 * \param device the AES device
 * \param src data to decrypt
 * \param dest decrypted data
 * \param len length of the data in block (4 bytes)
 *
 * \warning source data length (in bytes) should be a multiple of 16
 *          user needs to handle padding if needed
 */
int pi_aes_decrypt(struct pi_device* device, void* src, void* dest, uint16_t len);

/**
 * \brief decrypt data and then execute specified task
 *
 * \param device the AES device
 * \param src data to decrypt
 * \param dest decrypted data
 * \param len length of the data in block (4 bytes)
 * \param task the task executed after the decryption
 *
 * \warning source data length (in bytes) should be a multiple of 16
 *          user needs to handle padding if needed
 */
int pi_aes_decrypt_async(struct pi_device* device, void* src, void* dest, uint16_t len, struct pi_task* task);

/**
 * @}
 */

#ifdef __cplusplus
}
#endif
#endif  /* __PMSIS_DRIVERS_AES_H__ */
