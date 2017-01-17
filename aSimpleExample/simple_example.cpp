/*! \mainpage The Simple Example for easily creating Boost-Python distributables using Setuptools.
    \author Arvind Antonio de Menezes Pereira <arvind.pereira@gmail.com>
    \brief Simple Example : Part of a quick-and-dirty tutorial
    on how to quickly create Boost-Python modules which 
    can be packaged using setuptools.
    \date May 15, 2012
*/
#include <iostream>
#include "simple_example.h"
#include <boost/python.hpp>

/*!Declare our Boost Python Module
   enable_pickling is optional, but I find it useful to
   have persistent storage of simple data types in Python.
*/
BOOST_PYTHON_MODULE(simpleExample)
{
	using namespace boost::python;
	class_<SimpleExample>("simpleExample",init<>())
		.def("SayHello", &SimpleExample::SayHello)
		.enable_pickling()
		;
}

/*! Say Hello World.
*/
void SimpleExample::SayHello() 
{
	std::cout<<"Hello World!";
}
