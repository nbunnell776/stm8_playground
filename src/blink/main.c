#include <stdint.h>

#define F_CPU 1600000UL

#define _SFR_(mem_addr)	(*(volatile uint8_t *)(0x5000 + (mem_addr)))

#define PB_ODR	_SFR_(0x05)
#define PB_DDR	_SFR_(0x07)
#define PB_CR1	_SFR_(0x08)

#define LED_PIN	5
#define DELAY	1000

static inline void delay_ms(uint16_t ms){
	uint32_t i;
	for(i = 0; i < ((F_CPU / 18000UL) * ms); i++){
		__asm__("nop");
	}
}

void main(){
	PB_DDR |= (1 << LED_PIN);
	PB_CR1 |= (1 << LED_PIN);

	while (1) {
		PB_ODR ^= (1 << LED_PIN);
		delay_ms(DELAY);
	}
}
