# Compiler and flags
CC = arm-none-eabi-gcc
CFLAGS = -mcpu=cortex-m3 -mthumb -Wall -O2 -Iinc
LDFLAGS = -Tstm32f103.ld

# Source and object files
SRC = $(wildcard src/*.c)
OBJ = $(SRC:.c=.o)
TARGET = firmware.elf

# Default build rule
all: $(TARGET)

$(TARGET): $(OBJ)
	$(CC) $(CFLAGS) $(OBJ) -o $@ $(LDFLAGS)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# Clean build files
clean:
	rm -f $(OBJ) $(TARGET)