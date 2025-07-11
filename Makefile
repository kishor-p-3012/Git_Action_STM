# Compiler and flags
CC = arm-none-eabi-gcc
CFLAGS = -mcpu=cortex-m3 -mthumb -Wall -O2 -Iinc
ASFLAGS = -mcpu=cortex-m3 -mthumb
LDFLAGS = -Tstm32f103.ld

# Source and object files
SRC = $(wildcard src/*.c) src/startup.s
OBJ = $(SRC:.c=.o)
OBJ := $(OBJ:.s=.o)
TARGET = firmware.elf

# Default build rule
all: $(TARGET)

$(TARGET): $(OBJ)
	$(CC) $(CFLAGS) $(OBJ) -o $@ $(LDFLAGS)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

%.o: %.s
	$(CC) $(ASFLAGS) -c $< -o $@

# Clean build files
clean:
	rm -f $(OBJ) $(TARGET)