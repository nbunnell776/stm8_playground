;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Apr  3 2018) (Linux)
; This file was generated Thu Apr  8 21:44:28 2021
;--------------------------------------------------------
	.module main
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _uart_init
	.globl _printf
	.globl _putchar
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
;--------------------------------------------------------
; Stack segment in internal ram 
;--------------------------------------------------------
	.area	SSEG
__start__stack:
	.ds	1

;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area DABS (ABS)
;--------------------------------------------------------
; interrupt vector 
;--------------------------------------------------------
	.area HOME
__interrupt_vect:
	int s_GSINIT ;reset
	int 0x0000 ;trap
	int 0x0000 ;int0
	int 0x0000 ;int1
	int 0x0000 ;int2
	int 0x0000 ;int3
	int 0x0000 ;int4
	int 0x0000 ;int5
	int 0x0000 ;int6
	int 0x0000 ;int7
	int 0x0000 ;int8
	int 0x0000 ;int9
	int 0x0000 ;int10
	int 0x0000 ;int11
	int 0x0000 ;int12
	int 0x0000 ;int13
	int 0x0000 ;int14
	int 0x0000 ;int15
	int 0x0000 ;int16
	int 0x0000 ;int17
	int 0x0000 ;int18
	int 0x0000 ;int19
	int 0x0000 ;int20
	int 0x0000 ;int21
	int 0x0000 ;int22
	int 0x0000 ;int23
	int 0x0000 ;int24
	int 0x0000 ;int25
	int 0x0000 ;int26
	int 0x0000 ;int27
	int 0x0000 ;int28
	int 0x0000 ;int29
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
__sdcc_gs_init_startup:
__sdcc_init_data:
; stm8_genXINIT() start
	ldw x, #l_DATA
	jreq	00002$
00001$:
	clr (s_DATA - 1, x)
	decw x
	jrne	00001$
00002$:
	ldw	x, #l_INITIALIZER
	jreq	00004$
00003$:
	ld	a, (s_INITIALIZER - 1, x)
	ld	(s_INITIALIZED - 1, x), a
	decw	x
	jrne	00003$
00004$:
; stm8_genXINIT() end
	.area GSFINAL
	jp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
__sdcc_program_startup:
	jp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	main.c: 37: static inline void delay_ms(uint16_t ms){
;	-----------------------------------------
;	 function delay_ms
;	-----------------------------------------
_delay_ms:
	sub	sp, #8
;	main.c: 40: for(i = 0; i < ((F_CPU / DELAY_FACTOR) * ms); i++){
	clrw	x
	ldw	(0x03, sp), x
	ldw	(0x01, sp), x
00103$:
	ldw	y, (0x0b, sp)
	clrw	x
	pushw	y
	pushw	x
	push	#0xe8
	push	#0x03
	clrw	x
	pushw	x
	call	__mullong
	addw	sp, #8
	ldw	(0x07, sp), x
	ldw	(0x05, sp), y
	ldw	x, (0x03, sp)
	cpw	x, (0x07, sp)
	ld	a, (0x02, sp)
	sbc	a, (0x06, sp)
	ld	a, (0x01, sp)
	sbc	a, (0x05, sp)
	jrnc	00105$
;	main.c: 41: __asm__("nop");
	nop
;	main.c: 40: for(i = 0; i < ((F_CPU / DELAY_FACTOR) * ms); i++){
	ldw	x, (0x03, sp)
	addw	x, #0x0001
	ldw	(0x03, sp), x
	ld	a, (0x02, sp)
	adc	a, #0x00
	ld	(0x02, sp), a
	ld	a, (0x01, sp)
	adc	a, #0x00
	ld	(0x01, sp), a
	jra	00103$
00105$:
	addw	sp, #8
	ret
;	main.c: 45: void uart_init(){
;	-----------------------------------------
;	 function uart_init
;	-----------------------------------------
_uart_init:
;	main.c: 46: CLK_CKDIVR = 0x00; // set clock freq to 16MHz (no divider)
	mov	0x50c6+0, #0x00
;	main.c: 47: CLK_PCKENR1 = 0xFF; // enable all peripherals
	mov	0x50c7+0, #0xff
;	main.c: 48: UART1_CR2 = UART_CR2_TEN;	// enable TX
	mov	0x5235+0, #0x08
;	main.c: 49: UART1_CR3 &= ~(UART_CR3_STOP1 | UART_CR3_STOP2);	// use 1 stop bit
	ldw	x, #0x5236
	ld	a, (x)
	and	a, #0xcf
	ld	(x), a
;	main.c: 50: UART1_BRR2 = 0x0B;	// UART_DIV = (F_CPU / baud); 0x0683 = (16000000/9600)
	mov	0x5233+0, #0x0b
;	main.c: 51: UART1_BRR1 = 0x08;	// Move MSB and LSB to BRR2, then middle two bits to BRR1;				// set baud rate to 9600. Confusing, I know
	mov	0x5232+0, #0x08
	ret
;	main.c: 54: void putchar(char c){
;	-----------------------------------------
;	 function putchar
;	-----------------------------------------
_putchar:
;	main.c: 55: while(!(UART1_SR & UART_SR_TXE));
00101$:
	ldw	x, #0x5230
	ld	a, (x)
	tnz	a
	jrpl	00101$
;	main.c: 57: UART1_DR = c;
	ldw	x, #0x5231
	ld	a, (0x03, sp)
	ld	(x), a
	ret
;	main.c: 61: void main(void){
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	main.c: 63: PB_DDR |= (1<<LED_PIN);
	ldw	x, #0x5007
	ld	a, (x)
	or	a, #0x20
	ld	(x), a
;	main.c: 64: PB_CR1 |= (1<<LED_PIN);
	ldw	x, #0x5008
	ld	a, (x)
	or	a, #0x20
	ld	(x), a
;	main.c: 66: uart_init();
	call	_uart_init
;	main.c: 68: while (1) {
00102$:
;	main.c: 69: printf("\\");
	ldw	x, #___str_0+0
	pushw	x
	call	_printf
	addw	sp, #2
;	main.c: 40: for(i = 0; i < ((F_CPU / DELAY_FACTOR) * ms); i++){
	clrw	y
	clrw	x
00107$:
	cpw	y, #0x03e8
	ld	a, xl
	sbc	a, #0x00
	ld	a, xh
	sbc	a, #0x00
	jrnc	00102$
;	main.c: 41: __asm__("nop");
	nop
;	main.c: 40: for(i = 0; i < ((F_CPU / DELAY_FACTOR) * ms); i++){
	addw	y, #0x0001
	ld	a, xl
	adc	a, #0x00
	rlwa	x
	adc	a, #0x00
	ld	xh, a
	jra	00107$
;	main.c: 70: delay_ms(1);
	ret
	.area CODE
___str_0:
	.db 0x5C
	.db 0x00
	.area INITIALIZER
	.area CABS (ABS)
