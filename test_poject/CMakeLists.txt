cmake_minimum_required(VERSION 3.13)

set(PICO_BOARD pico)
set(PICO_PLATFORM rp2040)

include($ENV{PICO_SDK_PATH}/external/pico_sdk_import.cmake)

project(sample C CXX ASM)

#set(CMAKE_C_COMPILER /usr/bin/arm-none-eabi-gcc CACHE PATH "" FORCE)
#set(CMAKE_CXX_COMPILER /usr/bin/arm-none-eabi-g++ CACHE PATH "" FORCE)

set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

pico_sdk_init()

add_executable(sample main.c)

pico_enable_stdio_usb(sample 1)
pico_enable_stdio_uart(sample 1)
pico_add_extra_outputs(sample)

target_link_libraries(sample pico_stdlib)
