# project-templates

This is a collection of project templates for C++ and CUDA. CUDA projects are
compiled using `clang`, not `nvcc` for many reasons, the main one being
`nvcc`'s lack of flexibility and support for C++.

Some project templates like `cppjit-make` or `cpp-meta` are made to accomodate
users that simply want to have their experimental compilers to sit in a folder
and not install them.

In those cases, simply compile the compiler, make sure your environment
variables are well defined (like `CPPMETA_HOME` or `CPPJIT_HOME`) and you're
good to go.
