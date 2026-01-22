# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "3rdparty\\FluentUI\\src\\CMakeFiles\\fluentuiplugin_autogen.dir\\AutogenUsed.txt"
  "3rdparty\\FluentUI\\src\\CMakeFiles\\fluentuiplugin_autogen.dir\\ParseCache.txt"
  "3rdparty\\FluentUI\\src\\fluentuiplugin_autogen"
  "CMakeFiles\\appBaseLayout_autogen.dir\\AutogenUsed.txt"
  "CMakeFiles\\appBaseLayout_autogen.dir\\ParseCache.txt"
  "appBaseLayout_autogen"
  )
endif()
