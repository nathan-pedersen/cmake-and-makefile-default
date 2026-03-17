cmake_minimum_required(VERSION 3.10)
project(MyApp)

if(NOT CMAKE_BUILD_TYPE)
	set(CMAKE_BUILD_TYPE Debug)
endif()

file(GLOB SOURCES "src/*.c")
add_executable(MyApp ${SOURCES})

target_compile_options(MyApp PRIVATE 
	-std=c11 
	-pedantic 
	-Wall 
	-Werror 
	$<$<CONFIG:Debug>:-g -O0>
	$<$<CONFIG:Release>:-O2 -DNDEBUG>
)

target_include_directories(MyApp PRIVATE include/)

