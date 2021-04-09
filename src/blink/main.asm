;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Mar 24 2016) (Linux)
; This file was generated Mon Oct 19 20:58:05 2020
;--------------------------------------------------------
	.module main
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
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
;	main.c: 14: static inline void delay_ms(uint16_t ms){
;	-----------------------------------------
;	 function delay_ms
;	-----------------------------------------
_delay_ms:
	sub	sp, #8
;	main.c: 16: for(i = 0; i < ((F_CPU / 18000UL) * ms); i++){
	clrw	x
	ldw	(0x03, sp), x
	ldw	(0x01, sp), x
00103$:
	ldw	y, (0x0b, sp)
	clrw	x
	pushw	y
	pushw	x
	push	#0x58
	clrw	x
	pushw	x
	push	#0x00
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
;	main.c: 17: __asm__("nop");
	nop
;	main.c: 16: for(i = 0; i < ((F_CPU / 18000UL) * ms); i++){
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
;	main.c: 21: void main(){
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	main.c: 22: PB_DDR |= (1 << LED_PIN);
	ldw	x, #0x5007
	ld	a, (x)
	or	a, #0x20
	ld	(x), a
;	main.c: 23: PB_CR1 |= (1 << LED_PIN);
	ldw	x, #0x5008
	ld	a, (x)
	or	a, #0x20
	ld	(x), a
;	main.c: 25: while (1) {
00102$:
;	main.c: 26: PB_ODR ^= (1 << LED_PIN);
	ldw	x, #0x5005
	ld	a, (x)
	xor	a, #0x20
	ld	(x), a
;	main.c: 16: for(i = 0; i < ((F_CPU / 18000UL) * ms); i++){
	clrw	y
	clrw	x
00107$:
	cpw	y, #0x57c0
	ld	a, xl
	sbc	a, #0x01
	ld	a, xh
	sbc	a, #0x00
	jrnc	00102$
;	main.c: 17: __asm__("nop");
	nop
;	main.c: 16: for(i = 0; i < ((F_CPU / 18000UL) * ms); i++){
	addw	y, #0x0001
	ld	a, xl
	adc	a, #0x00
	rlwa	x
	adc	a, #0x00
	ld	xh, a
	jra	00107$
;	main.c: 27: delay_ms(DELAY);
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
