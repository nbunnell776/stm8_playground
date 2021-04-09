// Hardware register offset macro
#define _SFR_(mem_addr) (*(volatile uint8_t *)(0x5000 + (mem_addr)))

// Def registers for clock and (UART) serial port setup
#define CLK_CKDIVR _SFR_(0xc6) 	// Clock divider register
#define CLK_PCKENR1 _SFR_(0xc7) // Peripheral clock gating register 1

#define UART1_SR _SFR_(0x230) 	// UART1 status register
#define UART1_DR _SFR_(0x231) 	// UART1 data register
#define UART1_BRR1 _SFR_(0x232) // UART1 baud rate register 1
#define UART1_BRR2 _SFR_(0x233) // UART1 baud rate register 2 *set this register befor BRR1*
#define UART1_CR2 _SFR_(0x235) 	// UART1 control register 2
#define UART1_CR3 _SFR_(0x236) 	// UART1 control register 3

#define UART_CR2_TEN (1<<3)	// Set bit 3 of CR2 (TEN) to enable Tx transmit
#define UART_CR3_STOP2 (1<<5)	// Set bits 5 and 4 of CR3 to
#define UART_CR3_STOP1 (1<<4)	// 	configure 1 stop bit

#define UART_SR_TC (1<<6)	// Set bit 6 to enabled in the status register
#define UART_SR_TXE (1<<7)	// Set bit 7 to enabled in the status register

/*
	Pin ref
	- PD5 --> TX
	- PD6 --> RX
*/

// UART function declarations
void uart_init(){
	CLK_CKDIVR = 0x00; // set clock freq to 16MHz (no divider)
	CLK_PCKENR1 = 0xFF; // enable all peripherals
	UART1_CR2 = UART_CR2_TEN;	// enable TX
	UART1_CR3 &= ~(UART_CR3_STOP1 | UART_CR3_STOP2);	// use 1 stop bit
	UART1_BRR2 = 0x0B;	// UART_DIV = (F_CPU / baud); 0x0683 = (16000000/9600)
	UART1_BRR1 = 0x08;	// Move MSB and LSB to BRR2, then middle two bits to BRR1;				// set baud rate to 9600. Confusing, I know
}

void putchar(char c){
	UART1_DR = c;
	while(!(UART1_SR & UART_SR_TXE));

}
