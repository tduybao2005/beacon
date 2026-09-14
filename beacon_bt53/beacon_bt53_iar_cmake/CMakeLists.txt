# Define minimal required version of CMake.
cmake_minimum_required(VERSION "3.25")

# Project definition
project(
	beacon_bt53
	VERSION 1.0
	LANGUAGES C CXX ASM
)

# Include the definition of the slc_beacon_bt53 target,
# which contains the content of the SLC project
include(beacon_bt53.cmake)

add_executable(beacon_bt53
    # Add additional sources here
)

target_include_directories(beacon_bt53 PUBLIC
    # Add additional include paths here
)

target_compile_definitions(beacon_bt53 PUBLIC
    # Add additional macros here
)

target_compile_options(beacon_bt53 PUBLIC
    # Set additional compiler flags here
)

target_link_options(beacon_bt53 PUBLIC
    # Set additional linker flags here
)

# Link with the content defined in the SLC project
target_link_libraries(beacon_bt53 PRIVATE
    slc_beacon_bt53
)

# Include managed project content if available
include(beacon_bt53_project.cmake OPTIONAL RESULT_VARIABLE managed_project)
if(managed_project)
    message(STATUS "Using managed project content from ${managed_project}")
endif()

# Force the gcc linker command
set_target_properties(beacon_bt53 PROPERTIES LINKER_LANGUAGE C)

# Create .bin, .hex and .s37 artifacts after building the project
add_custom_command(TARGET beacon_bt53
    POST_BUILD
    COMMAND ${CMAKE_OBJCOPY} ${OBJCOPY_SREC_CMD} "$<TARGET_FILE:beacon_bt53>" "$<TARGET_FILE_DIR:beacon_bt53>/$<TARGET_FILE_BASE_NAME:beacon_bt53>.s37"
    COMMAND ${CMAKE_OBJCOPY} ${OBJCOPY_IHEX_CMD} "$<TARGET_FILE:beacon_bt53>" "$<TARGET_FILE_DIR:beacon_bt53>/$<TARGET_FILE_BASE_NAME:beacon_bt53>.hex"
    COMMAND ${CMAKE_OBJCOPY} ${OBJCOPY_BIN_CMD}  "$<TARGET_FILE:beacon_bt53>" "$<TARGET_FILE_DIR:beacon_bt53>/$<TARGET_FILE_BASE_NAME:beacon_bt53>.bin" 
)

# Run post-build pipeline to perform additional post-processing
if(post_build_command)
add_custom_command(TARGET beacon_bt53
    POST_BUILD
    WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/..
    COMMAND ${post_build_command}
)
endif()