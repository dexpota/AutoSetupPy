import os
from setuptools import setup, Extension

setup(
    name='Simple Example',
    version='0.0.1',
    author='Cannot believe I wrote this',
    author_email='dont_send_me_email@gmail.com',
    packages=['aSimpleExample'],
    license='Use as you wish. No guarantees whatsoever.',
    install_requires=[''],
    classifiers=['Development Status :: 3 - Alpha'],
    ext_modules=[
        Extension(
		  'aSimpleExample.simpleExample',
		  ['aSimpleExample/simple_example.cpp',],
		  include_dirs=['aSimpleExample','/usr/local/include',],
		  library_dirs=['/usr/local/lib',],
		  libraries=['boost_python',],
		  extra_compile_args=[]
		 )
     ],
)
