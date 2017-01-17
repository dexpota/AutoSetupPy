cmake_minimum_required(VERSION 3.3)
project("aSimpleExample")

include("AutoSetupPy.cmake")

set(srcs "aSimpleExample/simple_example.cpp")

find_package(Boost COMPONENTS "python" REQUIRED)
include_directories(${Boost_INCLUDE_DIRS})
link_directories(${Boost_LIBRARY_DIRS})

find_package(PythonLibs 2.7 REQUIRED)
include_directories(${PYTHON_INCLUDE_DIRS})

add_library (aSimpleExample SHARED ${srcs})
set_target_properties (aSimpleExample PROPERTIES OUTPUT_NAME SimpleExample )
set_target_properties (aSimpleExample PROPERTIES PREFIX "")
set_target_properties (aSimpleExample PROPERTIES SUFFIX ".so" )

target_link_libraries (aSimpleExample LINK_PUBLIC ${PYTHON_LIBRARIES}  ${Boost_LIBRARIES})

file(RELATIVE_PATH include_dirs "${CMAKE_SOURCE_DIR}" "${CMAKE_SOURCE_DIR}/aSimpleExample")
set(include_dirs ${include_dirs} ${Boost_INCLUDE_DIRS})
set(libraries_dirs "${Boost_LIBRARY_DIRS}")

create_setup_py("aSimpleExample.simpleExample" # module_name
								"${srcs}" # source code
								"${include_dirs}" # include directories
								"${Boost_LIBRARY_DIRS}" # libraries directories
								"boost_python" # libraries
								"${CMAKE_CXX_FLAGS}" # compiler flags
)
