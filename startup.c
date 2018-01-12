// Description to come!

// ----------------------------------------------------------------------------

// This function is required by the GCC tool-chain.
void _start(void);

// Reset Handler function. This function is expected by the GDB debugger
void Reset_Handler(void);

// Default exception handler
void Default_Handler(void);

// The _estack is provided by the linker script
extern unsigned int _estack;

// Pointer to reset handler vector type
typedef void (* const pHandler_t)(void);

// ----------------------------------------------------------------------------

// The vector table.
// This relies on the linker script to place at correct location in memory.

__attribute__ ((section(".vectors"),used))
pHandler_t __isr_vectors[] =
  {
        (pHandler_t) &_estack,                    // The initial stack pointer
        Reset_Handler,                                   // The reset handler
        Default_Handler,                          // The NMI handler
        Default_Handler,                          // The hard fault handler
        Default_Handler,                          // The MPU fault handler
        Default_Handler,                          // The bus fault handler
        Default_Handler,                          // The usage fault handler
        0,                                        // Reserved
        0,                                        // Reserved
        0,                                        // Reserved
        0,                                        // Reserved
        Default_Handler,                          // SVCall handler
        Default_Handler,                          // Debug monitor handler
        0,                                        // Reserved
        Default_Handler,                          // The PendSV handler
        Default_Handler,                          // The SysTick handler

    };

// ----------------------------------------------------------------------------

// This function is required by the GCC tool-chain.
void _start(void)
{
  while (1)
    ; // If you're here in your debug session then it means that the CPU
      // is up and running and you're able to compile, flash and debug it!
}

// Reset Handler function. This function is expected by the GDB debugger
void Reset_Handler(void)
{
  _start();
}

// Default exception handler
void Default_Handler(void)
{
  while (1)
    ; // Exception occured
}

// ----------------------------------------------------------------------------
