cmake_minimum_required(VERSION 3.15)

include(proj.conf)

find_package(bouffalo_sdk REQUIRED HINTS $ENV{BL_SDK_BASE})

file(GLOB_RECURSE sources "${CMAKE_CURRENT_SOURCE_DIR}/u8g2/*.c")

sdk_add_compile_definitions(-DCONFIG_CLI_CMD_ENABLE)

sdk_add_include_directories(.)
sdk_add_include_directories(u8g2)

target_sources(app PRIVATE ${sources})
sdk_set_main_file(main.c)

project(helloworld)

