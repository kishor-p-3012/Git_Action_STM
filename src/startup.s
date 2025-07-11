.syntax unified
.cpu cortex-m3
.thumb

.global Reset_Handler
.global _estack

.section .isr_vector, "a", %progbits
.type _vectors, %object
_vectors:
    .word _estack            /* Initial stack pointer */
    .word Reset_Handler      /* Reset Handler */
    .word 0                  /* NMI Handler */
    .word 0                  /* HardFault Handler */
    .word 0                  /* Reserved */
    .word 0                  /* Reserved */
    .word 0                  /* Reserved */
    .word 0                  /* Reserved */
    .word 0                  /* Reserved */
    .word 0                  /* Reserved */
    .word 0                  /* SVCall */
    .word 0                  /* Reserved */
    .word 0                  /* Reserved */
    .word 0                  /* PendSV */
    .word 0                  /* SysTick */

.size _vectors, . - _vectors

.section .text.Reset_Handler
.type Reset_Handler, %function
Reset_Handler:
    bl main
    b .

.size Reset_Handler, . - Reset_Handler

.section .stack, "a", %progbits
_estack:
    .word 0x20005000  /* Top of 20KB RAM */