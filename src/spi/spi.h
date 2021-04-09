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

#define LED_PIN 5		// Pin B5 :)

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

// Def registers for SPI setup
#define SPI_CR1 _SFR_(0x200)	// SPI control register 1
#define SPI_CR2 _SFR_(0x201)	// SPI control register 2
#define SPI_SR _SFR_(0x203)	// SPI status register
#define SPI_DR _SFR_(0x204)	// SPI data register

#define SPE (1<<6)		// SPI enable
#define BR0 (1<<3)		// Baud rate control
#define MSTR (1<<2)		// Master selection (0=slave)

#define SSM (1<<1)		// SW slave mgmt
#define SSI (1<<0)		// Internal slave select

#define BSY (1<<7)		// Busy status flag
#define TXE (1<<1)		// TX buffer empty (0=not empty)
#define RXNE (1<<0)		// RX buffer not empty (0=empty)

#define CS_PIN 4		// Chip select pin

/*
	Pin ref
	- PC5 --> SCK
	- PC6 --> MOSI
	- PC7 --> MISO
	- PC4 --> CS
*/

// SPI function definitions
void SPI_init(){
	// Config CS pin
	PC_DDR |= (1<<CS_PIN);
	PC_CR1 |= (1<<CS_PIN);
	PC_ODR |= (1<<CS_PIN);

	// Set SPI master clock to 500kHz
	SPI_CR2 = (1<<SSM) | (1<<SSI);
	SPI_CR1 = (1<<MSTR) | (1<<SPE) | (1<<BR0);
}

void SPI_write(uint8_t data){
	SPI_DR = data;
	while(!(SPI_SR & (1<<TXE)));
}

uint8_t SPI_read(){
	SPI_write(0xff);
	while(!(SPI_SR & (1<<RXNE)));
	return SPI_DR;
}

void chip_select(){
	PC_ODR &= ~(1<<CS_PIN);
}

void chip_deselect(){
	PC_ODR |= ~(1<<CS_PIN);
}
