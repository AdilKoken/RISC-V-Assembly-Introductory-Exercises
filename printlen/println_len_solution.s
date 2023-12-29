.globl _start
.globl __start
.option norelax

.org 0x400
.data

text_1: .asciz "Hi!"

.org 0x200
.text

__start:
_start:

la a0, text_1
jal ra, println_len
ebreak

# arguments:
#   a0: pointer to string
# returns:
#   a0: string length

; -------- SOLUTION  ----------

println_len:

addi sp, sp, -16
sw s0, 0(sp)
sw a0, 4(sp)
sw ra, 8(sp)
; saved register, since we have a function call to print_char, we cannot use t0 as a pointer 
addi s0, a0, 0 ; pointer to string

loop:
lb t0, 0(s0) ;load char
beq t0, zero, end_loop
addi s0, s0, 1

add a0, t0, zero
jal ra, print_char
j loop

end_loop:
;new line = 0x0a
addi a0, zero, 10
jal ra, print_char

; Length = the difference between the pointer and the beginning of the string
; alternatively, use a counter and increment it by 1 each time 
lw t0, 4(sp)
sub a0, s0, t0 

; clean up the stack 
lw s0, 0(sp)
lw ra, 8(sp)
addi sp, sp, 16
ret

; -------- SOLUTION ----------

// print_char function
// Argumente:
// a0: char (ASCII-Wert)

print_char:
    li   a1, SERIAL_PORT_BASE           // load base address of serial port

tx_busy:
    lw   t0, SERP_TX_ST_REG_o(a1)       // read status of transmitter
    andi t0, t0, SERP_TX_ST_REG_READY_m // mask ready bit
    beq  t0, zero, tx_busy              // if not ready wait for ready condition
    sw   a0, SERP_TX_DATA_REG_o(a1)     // write byte to Tx data register
    ret




//  Template file with defines of peripheral registers
//  QtRVSim simulator https://github.com/cvut/qtrvsim/
//
//  template.S       - example file
//
//  (C) 2021 by Pavel Pisa
//      e-mail:   pisa@cmp.felk.cvut.cz
//      homepage: http://cmp.felk.cvut.cz/~pisa
//      work:     http://www.pikron.com/
//      license:  public domain

// Directives to make interesting windows visible
#pragma qtrvsim show terminal
#pragma qtrvsim show registers
#pragma qtrvsim show memory

// Serial port/terminal registers
// There is mirror of this region at address 0xffff0000
// to match QtSpim and Mars emulators

.equ SERIAL_PORT_BASE,      0xffffc000 // base address of serial port region

.equ SERP_RX_ST_REG,        0xffffc000 // Receiver status register
.equ SERP_RX_ST_REG_o,          0x0000 // Offset of RX_ST_REG
.equ SERP_RX_ST_REG_READY_m,       0x1 // Data byte is ready to be read
.equ SERP_RX_ST_REG_IE_m,          0x2 // Enable Rx ready interrupt

.equ SERP_RX_DATA_REG,      0xffffc004 // Received data byte in 8 LSB bits
.equ SERP_RX_DATA_REG_o,        0x0004 // Offset of RX_DATA_REG

.equ SERP_TX_ST_REG,        0xffffc008 // Transmitter status register
.equ SERP_TX_ST_REG_o,          0x0008 // Offset of TX_ST_REG
.equ SERP_TX_ST_REG_READY_m,       0x1 // Transmitter can accept next byte
.equ SERP_TX_ST_REG_IE_m,          0x2 // Enable Tx ready interrupt

.equ SERP_TX_DATA_REG,      0xffffc00c // Write word to send 8 LSB bits to terminal
.equ SERP_TX_DATA_REG_o,        0x000c // Offset of TX_DATA_REG


// Memory mapped peripheral for dial knobs input,
// LED and RGB LEDs output designed to match
// MZ_APO education Zynq based board developed
// by Petr Porazil and Pavel Pisa at PiKRON.com company

.equ SPILED_REG_BASE,       0xffffc100 // base of SPILED port region

.equ SPILED_REG_LED_LINE,   0xffffc104 // 32 bit word mapped as output
.equ SPILED_REG_LED_LINE_o,     0x0004 // Offset of the LED_LINE
.equ SPILED_REG_LED_RGB1,   0xffffc110 // RGB LED 1 color components
.equ SPILED_REG_LED_RGB1_o,     0x0010 // Offset of LED_RGB1
.equ SPILED_REG_LED_RGB2,   0xffffc114 // RGB LED 2 color components
.equ SPILED_REG_LED_RGB2_o,     0x0014 // Offset of LED_RGB2
.equ SPILED_REG_KNOBS_8BIT, 0xffffc124 // Three 8 bit knob values
.equ SPILED_REG_KNOBS_8BIT_o,   0x0024 // Offset of KNOBS_8BIT

// The simple 16-bit per pixel (RGB565) frame-buffer
// display size is 480 x 320 pixel
// Pixel format RGB565 expect
//   bits 11 .. 15 red component
//   bits  5 .. 10 green component
//   bits  0 ..  4 blue component
.equ LCD_FB_START,          0xffe00000
.equ LCD_FB_END,            0xffe4afff

// Mapping of interrupts
// Irq number   Cause/Status Bit   Source
//  2 / HW0      10                Serial port ready to accept character to Tx
//  3 / HW1      11                There is received character ready to be read
//  7 / HW5      15                Counter reached value in Compare register



