#include "main.h"
#include <stdio.h>

int main(void) {
    printf("Hello from STM32 CI/CD pipeline!\n");

    while (1) {
        // Simulate blinking LED with messages
        printf("Toggling LED ON\n");
        // delay simulation
        for (volatile int i = 0; i < 1000000; ++i);
        printf("Toggling LED OFF\n");
        printf("Toggling LED OFF\n");
        for (volatile int i = 0; i < 1000000; ++i);
    }

    return 0;
}