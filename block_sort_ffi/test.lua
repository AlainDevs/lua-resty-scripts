local ffi = require("ffi")

-- Define the C function signature
ffi.cdef[[
void block_sort(int* arr, int n);
]]

-- Load the shared library
local block_sort_lib = ffi.load("block_sort.so")

-- Create a test array
local arr = ffi.new("int[?]", 10, {5, 3, 9, 1, 7, 6, 8, 2, 4, 0})

-- Call the Block Sort function
block_sort_lib.block_sort(arr, 10)

-- Print the sorted array
for i = 0, 9 do
    ngx.say(arr[i])
end
