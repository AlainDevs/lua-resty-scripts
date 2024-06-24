-- Block Sort implementation in LuaJIT for OpenResty with localized functions and variables

-- Localize functions and variables
local math_ceil = math.ceil
local math_sqrt = math.sqrt
local math_floor = math.floor
local table_insert = table.insert
local table_sort = table.sort

-- Function to find the minimum value in an array
local function find_min(arr)
    local min = arr[1]
    for i = 2, #arr do
        if arr[i] < min then
            min = arr[i]
        end
    end
    return min
end

-- Function to find the maximum value in an array
local function find_max(arr)
    local max = arr[1]
    for i = 2, #arr do
        if arr[i] > max then
            max = arr[i]
        end
    end
    return max
end

-- Function to perform Block Sort
local function block_sort(arr)
    local n = #arr
    if n <= 1 then
        return arr
    end

    -- Find the minimum and maximum values in the array
    local min_val = find_min(arr)
    local max_val = find_max(arr)

    -- Calculate the number of blocks
    local block_size = math_ceil(math_sqrt(n))
    local num_blocks = math_ceil((max_val - min_val) / block_size)

    -- Create the blocks
    local blocks = {}
    for i = 1, num_blocks do
        blocks[i] = {}
    end

    -- Distribute elements into blocks
    for i = 1, n do
        local block_index = math_floor((arr[i] - min_val) / block_size) + 1
        table_insert(blocks[block_index], arr[i])
    end

    -- Sort each block
    for i = 1, num_blocks do
        table_sort(blocks[i])
    end

    -- Merge the sorted blocks
    local sorted_arr = {}
    for i = 1, num_blocks do
        for j = 1, #blocks[i] do
            table_insert(sorted_arr, blocks[i][j])
        end
    end

    return sorted_arr
end

-- Example usage
local arr = {3, 6, 2, 8, 5, 1, 4, 7}
local sorted_arr = block_sort(arr)

for i = 1, #sorted_arr do
    print(sorted_arr[i])
end
