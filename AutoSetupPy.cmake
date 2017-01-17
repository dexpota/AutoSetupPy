
function(to_python_list list output_variable)
	set(python_list "[")
  message("lista ${list}")
	foreach(var ${list})
		set(python_list "${python_list}'${var}',")
	endforeach()
	set(python_list "${python_list}]")
	set(${output_variable} ${python_list} PARENT_SCOPE)
endfunction(to_python_list)


function(create_setup_py module_name module_src)
	# Arguments: module_name module_src [include_dirs] [libraries_dirs] [libraries] [compiler_flags]
	set(extension_module_name "'${module_name}'")
	to_python_list("${module_src}" extension_sources)

	if(${ARGC} GREATER 2 AND NOT "${ARGV2}" STREQUAL "")
		# include directories
		to_python_list("${ARGV2}" "extension_include_dirs")
	endif()

	if("${extension_include_dirs}" STREQUAL "")
		set(extension_include_dirs "[]")
	endif()

	if(${ARGC} GREATER 3 AND NOT "${ARGV3}" STREQUAL "")
		# libraries_dirs
		to_python_list("${ARGV3}" extension_libraries_dirs)
	endif()

	if("${extension_libraries_dirs}" STREQUAL "")
		set(extension_libraries_dirs "[]")
	endif()

	if(${ARGC} GREATER 4 AND NOT "${ARGV4}" STREQUAL "")
		# libraries
		to_python_list("${ARGV4}" extension_libraries)
	endif()

	if("${extension_libraries}" STREQUAL "")
		set(extension_libraries "[]")
	endif()

	if(${ARGC} GREATER 5 AND NOT "${ARGV5}" STREQUAL "")
		# compiler_flags
		to_python_list("${ARGV5}" extension_compiler_flags)
	endif()

	if("${extension_compiler_flags}" STREQUAL "")
		set(extension_compiler_flags "[]")
	endif()

	#message(${extension_module_name})
	#message(${extension_sources})
	message(${extension_include_dirs})
	#message(${extension_libraries_dirs})
	#message(${extension_libraries})
	#message(${extension_compiler_flags})

	configure_file( ${CMAKE_SOURCE_DIR}/setup.py.in ${CMAKE_SOURCE_DIR}/setup.py )
endfunction()
