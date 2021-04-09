                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.5.0 #9253 (Apr  3 2018) (Linux)
                                      4 ; This file was generated Thu Apr  8 21:44:28 2021
                                      5 ;--------------------------------------------------------
                                      6 	.module main
                                      7 	.optsdcc -mstm8
                                      8 	
                                      9 ;--------------------------------------------------------
                                     10 ; Public variables in this module
                                     11 ;--------------------------------------------------------
                                     12 	.globl _main
                                     13 	.globl _uart_init
                                     14 	.globl _printf
                                     15 	.globl _putchar
                                     16 ;--------------------------------------------------------
                                     17 ; ram data
                                     18 ;--------------------------------------------------------
                                     19 	.area DATA
                                     20 ;--------------------------------------------------------
                                     21 ; ram data
                                     22 ;--------------------------------------------------------
                                     23 	.area INITIALIZED
                                     24 ;--------------------------------------------------------
                                     25 ; Stack segment in internal ram 
                                     26 ;--------------------------------------------------------
                                     27 	.area	SSEG
      000001                         28 __start__stack:
      000001                         29 	.ds	1
                                     30 
                                     31 ;--------------------------------------------------------
                                     32 ; absolute external ram data
                                     33 ;--------------------------------------------------------
                                     34 	.area DABS (ABS)
                                     35 ;--------------------------------------------------------
                                     36 ; interrupt vector 
                                     37 ;--------------------------------------------------------
                                     38 	.area HOME
      008000                         39 __interrupt_vect:
      008000 82 00 80 83             40 	int s_GSINIT ;reset
      008004 82 00 00 00             41 	int 0x0000 ;trap
      008008 82 00 00 00             42 	int 0x0000 ;int0
      00800C 82 00 00 00             43 	int 0x0000 ;int1
      008010 82 00 00 00             44 	int 0x0000 ;int2
      008014 82 00 00 00             45 	int 0x0000 ;int3
      008018 82 00 00 00             46 	int 0x0000 ;int4
      00801C 82 00 00 00             47 	int 0x0000 ;int5
      008020 82 00 00 00             48 	int 0x0000 ;int6
      008024 82 00 00 00             49 	int 0x0000 ;int7
      008028 82 00 00 00             50 	int 0x0000 ;int8
      00802C 82 00 00 00             51 	int 0x0000 ;int9
      008030 82 00 00 00             52 	int 0x0000 ;int10
      008034 82 00 00 00             53 	int 0x0000 ;int11
      008038 82 00 00 00             54 	int 0x0000 ;int12
      00803C 82 00 00 00             55 	int 0x0000 ;int13
      008040 82 00 00 00             56 	int 0x0000 ;int14
      008044 82 00 00 00             57 	int 0x0000 ;int15
      008048 82 00 00 00             58 	int 0x0000 ;int16
      00804C 82 00 00 00             59 	int 0x0000 ;int17
      008050 82 00 00 00             60 	int 0x0000 ;int18
      008054 82 00 00 00             61 	int 0x0000 ;int19
      008058 82 00 00 00             62 	int 0x0000 ;int20
      00805C 82 00 00 00             63 	int 0x0000 ;int21
      008060 82 00 00 00             64 	int 0x0000 ;int22
      008064 82 00 00 00             65 	int 0x0000 ;int23
      008068 82 00 00 00             66 	int 0x0000 ;int24
      00806C 82 00 00 00             67 	int 0x0000 ;int25
      008070 82 00 00 00             68 	int 0x0000 ;int26
      008074 82 00 00 00             69 	int 0x0000 ;int27
      008078 82 00 00 00             70 	int 0x0000 ;int28
      00807C 82 00 00 00             71 	int 0x0000 ;int29
                                     72 ;--------------------------------------------------------
                                     73 ; global & static initialisations
                                     74 ;--------------------------------------------------------
                                     75 	.area HOME
                                     76 	.area GSINIT
                                     77 	.area GSFINAL
                                     78 	.area GSINIT
      008083                         79 __sdcc_gs_init_startup:
      008083                         80 __sdcc_init_data:
                                     81 ; stm8_genXINIT() start
      008083 AE 00 00         [ 2]   82 	ldw x, #l_DATA
      008086 27 07            [ 1]   83 	jreq	00002$
      008088                         84 00001$:
      008088 72 4F 00 00      [ 1]   85 	clr (s_DATA - 1, x)
      00808C 5A               [ 2]   86 	decw x
      00808D 26 F9            [ 1]   87 	jrne	00001$
      00808F                         88 00002$:
      00808F AE 00 00         [ 2]   89 	ldw	x, #l_INITIALIZER
      008092 27 09            [ 1]   90 	jreq	00004$
      008094                         91 00003$:
      008094 D6 88 F9         [ 1]   92 	ld	a, (s_INITIALIZER - 1, x)
      008097 D7 00 00         [ 1]   93 	ld	(s_INITIALIZED - 1, x), a
      00809A 5A               [ 2]   94 	decw	x
      00809B 26 F7            [ 1]   95 	jrne	00003$
      00809D                         96 00004$:
                                     97 ; stm8_genXINIT() end
                                     98 	.area GSFINAL
      00809D CC 80 80         [ 2]   99 	jp	__sdcc_program_startup
                                    100 ;--------------------------------------------------------
                                    101 ; Home
                                    102 ;--------------------------------------------------------
                                    103 	.area HOME
                                    104 	.area HOME
      008080                        105 __sdcc_program_startup:
      008080 CC 81 0D         [ 2]  106 	jp	_main
                                    107 ;	return from main will return to caller
                                    108 ;--------------------------------------------------------
                                    109 ; code
                                    110 ;--------------------------------------------------------
                                    111 	.area CODE
                                    112 ;	main.c: 37: static inline void delay_ms(uint16_t ms){
                                    113 ;	-----------------------------------------
                                    114 ;	 function delay_ms
                                    115 ;	-----------------------------------------
      0080A0                        116 _delay_ms:
      0080A0 52 08            [ 2]  117 	sub	sp, #8
                                    118 ;	main.c: 40: for(i = 0; i < ((F_CPU / DELAY_FACTOR) * ms); i++){
      0080A2 5F               [ 1]  119 	clrw	x
      0080A3 1F 03            [ 2]  120 	ldw	(0x03, sp), x
      0080A5 1F 01            [ 2]  121 	ldw	(0x01, sp), x
      0080A7                        122 00103$:
      0080A7 16 0B            [ 2]  123 	ldw	y, (0x0b, sp)
      0080A9 5F               [ 1]  124 	clrw	x
      0080AA 90 89            [ 2]  125 	pushw	y
      0080AC 89               [ 2]  126 	pushw	x
      0080AD 4B E8            [ 1]  127 	push	#0xe8
      0080AF 4B 03            [ 1]  128 	push	#0x03
      0080B1 5F               [ 1]  129 	clrw	x
      0080B2 89               [ 2]  130 	pushw	x
      0080B3 CD 81 77         [ 4]  131 	call	__mullong
      0080B6 5B 08            [ 2]  132 	addw	sp, #8
      0080B8 1F 07            [ 2]  133 	ldw	(0x07, sp), x
      0080BA 17 05            [ 2]  134 	ldw	(0x05, sp), y
      0080BC 1E 03            [ 2]  135 	ldw	x, (0x03, sp)
      0080BE 13 07            [ 2]  136 	cpw	x, (0x07, sp)
      0080C0 7B 02            [ 1]  137 	ld	a, (0x02, sp)
      0080C2 12 06            [ 1]  138 	sbc	a, (0x06, sp)
      0080C4 7B 01            [ 1]  139 	ld	a, (0x01, sp)
      0080C6 12 05            [ 1]  140 	sbc	a, (0x05, sp)
      0080C8 24 16            [ 1]  141 	jrnc	00105$
                                    142 ;	main.c: 41: __asm__("nop");
      0080CA 9D               [ 1]  143 	nop
                                    144 ;	main.c: 40: for(i = 0; i < ((F_CPU / DELAY_FACTOR) * ms); i++){
      0080CB 1E 03            [ 2]  145 	ldw	x, (0x03, sp)
      0080CD 1C 00 01         [ 2]  146 	addw	x, #0x0001
      0080D0 1F 03            [ 2]  147 	ldw	(0x03, sp), x
      0080D2 7B 02            [ 1]  148 	ld	a, (0x02, sp)
      0080D4 A9 00            [ 1]  149 	adc	a, #0x00
      0080D6 6B 02            [ 1]  150 	ld	(0x02, sp), a
      0080D8 7B 01            [ 1]  151 	ld	a, (0x01, sp)
      0080DA A9 00            [ 1]  152 	adc	a, #0x00
      0080DC 6B 01            [ 1]  153 	ld	(0x01, sp), a
      0080DE 20 C7            [ 2]  154 	jra	00103$
      0080E0                        155 00105$:
      0080E0 5B 08            [ 2]  156 	addw	sp, #8
      0080E2 81               [ 4]  157 	ret
                                    158 ;	main.c: 45: void uart_init(){
                                    159 ;	-----------------------------------------
                                    160 ;	 function uart_init
                                    161 ;	-----------------------------------------
      0080E3                        162 _uart_init:
                                    163 ;	main.c: 46: CLK_CKDIVR = 0x00; // set clock freq to 16MHz (no divider)
      0080E3 35 00 50 C6      [ 1]  164 	mov	0x50c6+0, #0x00
                                    165 ;	main.c: 47: CLK_PCKENR1 = 0xFF; // enable all peripherals
      0080E7 35 FF 50 C7      [ 1]  166 	mov	0x50c7+0, #0xff
                                    167 ;	main.c: 48: UART1_CR2 = UART_CR2_TEN;	// enable TX
      0080EB 35 08 52 35      [ 1]  168 	mov	0x5235+0, #0x08
                                    169 ;	main.c: 49: UART1_CR3 &= ~(UART_CR3_STOP1 | UART_CR3_STOP2);	// use 1 stop bit
      0080EF AE 52 36         [ 2]  170 	ldw	x, #0x5236
      0080F2 F6               [ 1]  171 	ld	a, (x)
      0080F3 A4 CF            [ 1]  172 	and	a, #0xcf
      0080F5 F7               [ 1]  173 	ld	(x), a
                                    174 ;	main.c: 50: UART1_BRR2 = 0x0B;	// UART_DIV = (F_CPU / baud); 0x0683 = (16000000/9600)
      0080F6 35 0B 52 33      [ 1]  175 	mov	0x5233+0, #0x0b
                                    176 ;	main.c: 51: UART1_BRR1 = 0x08;	// Move MSB and LSB to BRR2, then middle two bits to BRR1;				// set baud rate to 9600. Confusing, I know
      0080FA 35 08 52 32      [ 1]  177 	mov	0x5232+0, #0x08
      0080FE 81               [ 4]  178 	ret
                                    179 ;	main.c: 54: void putchar(char c){
                                    180 ;	-----------------------------------------
                                    181 ;	 function putchar
                                    182 ;	-----------------------------------------
      0080FF                        183 _putchar:
                                    184 ;	main.c: 55: while(!(UART1_SR & UART_SR_TXE));
      0080FF                        185 00101$:
      0080FF AE 52 30         [ 2]  186 	ldw	x, #0x5230
      008102 F6               [ 1]  187 	ld	a, (x)
      008103 4D               [ 1]  188 	tnz	a
      008104 2A F9            [ 1]  189 	jrpl	00101$
                                    190 ;	main.c: 57: UART1_DR = c;
      008106 AE 52 31         [ 2]  191 	ldw	x, #0x5231
      008109 7B 03            [ 1]  192 	ld	a, (0x03, sp)
      00810B F7               [ 1]  193 	ld	(x), a
      00810C 81               [ 4]  194 	ret
                                    195 ;	main.c: 61: void main(void){
                                    196 ;	-----------------------------------------
                                    197 ;	 function main
                                    198 ;	-----------------------------------------
      00810D                        199 _main:
                                    200 ;	main.c: 63: PB_DDR |= (1<<LED_PIN);
      00810D AE 50 07         [ 2]  201 	ldw	x, #0x5007
      008110 F6               [ 1]  202 	ld	a, (x)
      008111 AA 20            [ 1]  203 	or	a, #0x20
      008113 F7               [ 1]  204 	ld	(x), a
                                    205 ;	main.c: 64: PB_CR1 |= (1<<LED_PIN);
      008114 AE 50 08         [ 2]  206 	ldw	x, #0x5008
      008117 F6               [ 1]  207 	ld	a, (x)
      008118 AA 20            [ 1]  208 	or	a, #0x20
      00811A F7               [ 1]  209 	ld	(x), a
                                    210 ;	main.c: 66: uart_init();
      00811B CD 80 E3         [ 4]  211 	call	_uart_init
                                    212 ;	main.c: 68: while (1) {
      00811E                        213 00102$:
                                    214 ;	main.c: 69: printf("\\");
      00811E AE 81 45         [ 2]  215 	ldw	x, #___str_0+0
      008121 89               [ 2]  216 	pushw	x
      008122 CD 81 61         [ 4]  217 	call	_printf
      008125 5B 02            [ 2]  218 	addw	sp, #2
                                    219 ;	main.c: 40: for(i = 0; i < ((F_CPU / DELAY_FACTOR) * ms); i++){
      008127 90 5F            [ 1]  220 	clrw	y
      008129 5F               [ 1]  221 	clrw	x
      00812A                        222 00107$:
      00812A 90 A3 03 E8      [ 2]  223 	cpw	y, #0x03e8
      00812E 9F               [ 1]  224 	ld	a, xl
      00812F A2 00            [ 1]  225 	sbc	a, #0x00
      008131 9E               [ 1]  226 	ld	a, xh
      008132 A2 00            [ 1]  227 	sbc	a, #0x00
      008134 24 E8            [ 1]  228 	jrnc	00102$
                                    229 ;	main.c: 41: __asm__("nop");
      008136 9D               [ 1]  230 	nop
                                    231 ;	main.c: 40: for(i = 0; i < ((F_CPU / DELAY_FACTOR) * ms); i++){
      008137 72 A9 00 01      [ 2]  232 	addw	y, #0x0001
      00813B 9F               [ 1]  233 	ld	a, xl
      00813C A9 00            [ 1]  234 	adc	a, #0x00
      00813E 02               [ 1]  235 	rlwa	x
      00813F A9 00            [ 1]  236 	adc	a, #0x00
      008141 95               [ 1]  237 	ld	xh, a
      008142 20 E6            [ 2]  238 	jra	00107$
                                    239 ;	main.c: 70: delay_ms(1);
      008144 81               [ 4]  240 	ret
                                    241 	.area CODE
      008145                        242 ___str_0:
      008145 5C                     243 	.db 0x5C
      008146 00                     244 	.db 0x00
                                    245 	.area INITIALIZER
                                    246 	.area CABS (ABS)
