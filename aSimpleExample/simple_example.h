/*! @author Arvind Pereira <arvind.pereira@gmail.com>
    @date May 15, 2012
    @brief Simple Example : Part of a quick-and-dirty tutorial
    on how to quickly create Boost-Python modules which 
    can be packaged using setuptools.
*/
#ifndef __SIMPLE_EXAMPLE_H__
 #define __SIMPLE_EXAMPLE_H__

//! Make sure we include the boost-python header file
#include <boost/python.hpp>

//! Class declaration
class SimpleExample
{
   public:
	SimpleExample() {};
	void SayHello();
};
#endif
