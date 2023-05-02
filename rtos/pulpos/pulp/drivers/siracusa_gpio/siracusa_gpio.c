#include "siracusa_gpio.h"
#include "common/bitfield.h"
#include "siracusa_gpio_hal.h"
#include "siracusa_padctrl.h"

#ifndef MEM_BARRIER
#define MEM_BARRIER asm volatile("": : :"memory")
#endif

#ifndef REG_WRITE32
#define REG_WRITE32(addr, value) *((volatile uint32_t*) addr) = (uint32_t) value;
#endif

#ifndef REG_READ32
#define REG_READ32(addr) *((volatile uint32_t*) addr)
#endif

void siracusa_gpio_configure(uint32_t number, uint32_t direction){
  // Configure padmux to connect gpio to pad
  padctrl_mode_set(number, PAD_MODE_GPIO);

  // Now configure the GPIO peripheral
  uint32_t addr = SIRACUSA_GPIO_BASE_ADDR + GPIO_GPIO_MODE_0_REG_OFFSET + number/16*4;
  uint32_t reg = REG_READ32(addr);
  bitfield_field32_t field = GPIO_GPIO_MODE_0_MODE_0_FIELD;
  field.index = number%16*2;
  reg = bitfield_field32_write(reg, field, (direction == SIRACUSA_GPIO_DIRECTION_INPUT)? GPIO_GPIO_MODE_0_MODE_0_VALUE_INPUT_ONLY: GPIO_GPIO_MODE_0_MODE_0_VALUE_OUTPUT_ACTIVE);
  REG_WRITE32(addr, reg);
  // Enable/Disable input sampling
  addr = SIRACUSA_GPIO_BASE_ADDR + GPIO_GPIO_EN_0_REG_OFFSET + number/32*4;
  reg = REG_READ32(addr);
  reg = bitfield_bit32_write(reg, number%32, direction == SIRACUSA_GPIO_DIRECTION_INPUT);
  REG_WRITE32(addr, reg);
  MEM_BARRIER;
}


void siracusa_gpio_set(uint32_t number, uint32_t value){
  uint32_t addr;
  if (value == 1) {
    addr = SIRACUSA_GPIO_BASE_ADDR + GPIO_GPIO_SET_0_REG_OFFSET + number/32*4;
  } else {
    addr = SIRACUSA_GPIO_BASE_ADDR + GPIO_GPIO_CLEAR_0_REG_OFFSET + number/32*4;
  }
  REG_WRITE32(addr, 1<<(number%32));
  MEM_BARRIER;
}

uint32_t siracusa_gpio_get(uint32_t number){
  uint32_t addr = SIRACUSA_GPIO_BASE_ADDR + GPIO_GPIO_IN_0_REG_OFFSET + number/32*4;
  uint32_t reg = REG_READ32(addr);
  return bitfield_bit32_read(reg, number%32);
  MEM_BARRIER;
}
