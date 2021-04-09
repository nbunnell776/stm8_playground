#ifndef IO_H
#define IO_H

#ifndef F_CPU
#warning "F_CPU not defined, using 16MHz by default"
#define F_CPU = 16000000UL
#endif

#include <stdint.h>

// Hardware register offset macro
#define _SFR_(mem_addr) (*(volatile uint8_t *)(0x5000 + (mem_addr)))

// Def HW registers for IO ports
#define PB_ODR _SFR_(0x05) 	// Port B data output latch register
#define PB_DDR _SFR_(0x07) 	// Port B data direction register
#define PB_CR1 _SFR_(0x08) 	// Port B control register 1

#define PC_ODR _SFR_(0x0A) 	// Port C data output latch register
#define PC_DDR _SFR_(0x0C) 	// Port C data direction register
#define PC_CR1 _SFR_(0x0D) 	// Port C control register 1

#define PD_ODR _SFR_(0x0F) 	// Port D data output latch register
#define PD_DDR _SFR_(0x11) 	// Port D data direction register
#define PD_CR1 _SFR_(0x12) 	// Port D control register 1

// Delay constants and function declaration in mSec
#define DELAY 100
#define DELAY_FACTOR 16000 	// Trial and error value to get 1 sec = 1 sec

static inline void delay_ms(uint16_t ms){
	uint32_t i;

	for(i = 0; i < ((F_CPU / DELAY_FACTOR) * ms); i++){
		__asm__("nop");
	}
}

static inline void outputflip(ODR, PIN)
		ODR ^= (1 << PIN);
}

#endif /* IO_H */
