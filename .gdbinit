set auto-load safe-path /
set demangle-style gnu-v3
set history save on
set print array on
set print demangle on
set print null-stop
set print object on
set print pretty on
set print sevenbit-strings off
set print static-members on
set print vtbl on

# Modern C++ and debugging settings
set language c++
set confirm off
set print elements 200
set breakpoint pending on
set overload-resolution on

# Note: Modern GDB (7.0+) includes built-in pretty printers for STL containers
# that are more reliable than custom macros. These are enabled by default.
# If you need custom STL debugging, consider using Python-based pretty printers.
