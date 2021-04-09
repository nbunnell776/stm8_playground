#include <stdint.h>
#include <stdio.h>

#define F_CPU 16000000UL

// Hardware register offset macro
#define _SFR_(mem_addr) (*(volatile uint8_t *)(0x5000 + (mem_addr)))

// Def HW registers for LED
#define PB_ODR _SFR_(0x05) 	// Port B data output latch register
#define PB_DDR _SFR_(0x07) 	// Port B data direction register
#define PB_CR1 _SFR_(0x08) 	// Port B control register 1
#define LED_PIN 5		// Pin B5 :)

// Def registers for clock and serial port setup
#define CLK_CKDIVR _SFR_(0xc6) 	// Clock divider register
#define CLK_PCKENR1 _SFR_(0xc7) // Peripheral clock gating register 1

#define UART1_SR _SFR_(0x230) 	// UART1 status register
#define UART1_DR _SFR_(0x231) 	// UART1 data register
#define UART1_BRR1 _SFR_(0x232) // UART1 baud rate register 1
#define UART1_BRR2 _SFR_(0x233) // UART1 baud rate register 2 *set this register befor BRR1*
#define UART1_CR2 _SFR_(0x235) 	// UART1 control register 2
#define UART1_CR3 _SFR_(0x236) 	// UART1 control register 3

#define UART_CR2_TEN (1<<3)		// Set bit 3 of CR2 (TEN) to enable Tx transmit
#define UART_CR3_STOP2 (1<<5)	// Set bits 5 and 4 of CR3 to
#define UART_CR3_STOP1 (1<<4)	// 	configure 1 stop bit

#define UART_SR_TC (1<<6)		// Set bit 6 to enabled in the status register
#define UART_SR_TXE (1<<7)	// Set bit 7 to enabled in the status register

// Delay constant and function declaration in mSec
#define DELAY 100
#define DELAY_FACTOR 16000 	// Trial and error value to get 1 sec = 1 sec

static inline void delay_ms(uint16_t ms){
	uint32_t i;

	for(i = 0; i < ((F_CPU / DELAY_FACTOR) * ms); i++){
		__asm__("nop");
	}
}

void uart_init(){
	CLK_CKDIVR = 0x00; // set clock freq to 16MHz (no divider)
	CLK_PCKENR1 = 0xFF; // enable all peripherals
	UART1_CR2 = UART_CR2_TEN;	// enable TX
	UART1_CR3 &= ~(UART_CR3_STOP1 | UART_CR3_STOP2);	// use 1 stop bit
	UART1_BRR2 = 0x0B;	// UART_DIV = (F_CPU / baud); 0x0683 = (16000000/9600)
	UART1_BRR1 = 0x08;	// Move MSB and LSB to BRR2, then middle two bits to BRR1;				// set baud rate to 9600. Confusing, I know
}

void putchar(char c){
	while(!(UART1_SR & UART_SR_TXE));

	UART1_DR = c;
}

// Main
void main(void){
	// Config LED
	PB_DDR |= (1<<LED_PIN);
	PB_CR1 |= (1<<LED_PIN);

	uart_init();

	while (1) {
		printf("\\");
		delay_ms(1);
		//PB_ODR ^= (1 << LED_PIN);
	}

}
