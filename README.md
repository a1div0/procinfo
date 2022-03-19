<a href="http://tarantool.org">
   <img src="https://avatars2.githubusercontent.com/u/2344919?v=2&s=250"
align="right">
</a>

# Procinfo for Tarantool
## Table of contents
* [General information](#general-information)
* [Installation](#installation)
* [API](#api)
* [An example of using the module](#an-example-of-using-the-module)

## General information
Utility for getting operating system information on the current process

## Installation
You can:
* clone the repository:
``` shell
git clone https://github.com/a1div0/procinfo.git
```
* install the `procinfo` module using `tarantoolctl`:
```shell
tarantoolctl rocks install https://raw.githubusercontent.com/a1div0/procinfo/main/procinfo-0.1.1-1.rockspec
```

## API
* `local current_info = require('procinfo').snapshot()` - gets the current
information about the process as an object
* `current_info:process_id()` - gets the ID of this process as a number
* `current_info:ram_mem_size_kB()` - gets the amount of RAM-memory occupied
by the process in kilobytes
* `current_info:virtual_mem_size_kB()` - gets the amount of virtual memory
used by the process in kilobytes

## An example of using the module
```lua
local procinfo = require('test.procinfo')
local current_info = procinfo.snapshot()
local s = ('RES: %d kB; VIRT: %d kB'):format(current_info:ram_mem_size_kB(), current_info:virtual_mem_size_kB())
print(s)
```