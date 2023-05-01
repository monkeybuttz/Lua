<<<<<<< HEAD
-- read csv file and store in a table

=======
-- -- read csv file and store in a table
-- -- Function to split a string by a separator
-- function split(str, sep)
--     local result = {}
--     local regex = "([^" .. sep .. "]+)"
--     for part in string.gmatch(str, regex) do
--         table.insert(result, part)
--     end
--     return result
-- end

-- -- Function to read CSV file and return a table
-- function read_csv(file_path)
--     local data = {}
--     local headers
--     for line in io.lines(file_path) do
--         if not headers then
--             headers = split(line, "\t")
--         else
--             local row = {}
--             local values = split(line, "\t")
--             for i, value in ipairs(values) do
--                 row[headers[i]] = value
--             end
--             table.insert(data, row)
--         end
--     end
--     return data, headers
-- end

-- -- Read CSV file and store the data in a table
-- local file_path = "data.csv"
-- local table_data, headers = read_csv(file_path)

-- -- Print the table
-- for _, row in ipairs(table_data) do
--     for _, header in ipairs(headers) do
--         io.write(header .. ": " .. row[header] .. "\t")
--     end
--     io.write("\n")
-- end

-- VERSION 2
>>>>>>> 00f74ea7fe2592c65001939b26274d53cfb372a3
-- Function to split a string by a separator
function split(str, sep)
    local result = {}
    local regex = ("([^%s]+)"):format(sep)
    for each in str:gmatch(regex) do
        table.insert(result, each)
    end
    return result
end

-- Function to read CSV file and return a table
function read_csv(file_path)
    local file = io.open(file_path, "r")
    local table_data = {}
    local headers = {}
    local row_count = 0
    for line in file:lines() do
        local row = split(line, ",")
        if row_count == 0 then
            for i, col in ipairs(row) do
                headers[i] = col
            end
        else
            table_data[row_count] = row
        end
        row_count = row_count + 1
    end
<<<<<<< HEAD
    file:close()
    return table_data, headers
=======
    return data
>>>>>>> 00f74ea7fe2592c65001939b26274d53cfb372a3
end

-- Read CSV file and store the data in a table
local file_path = "data.csv"
local table_data = read_csv(file_path)

<<<<<<< HEAD
-- Print out the table to prove data is stored correctly
for i, header in ipairs(headers) do
    io.write(header)
    if i < #headers then
        io.write(",    ")
    end
end
io.write("\n")
for i, row in ipairs(table_data) do
    for j, col in ipairs(row) do
        io.write(col)
        if j < #row then
            io.write(", ")
        end
=======
-- Print the table
for _, row in ipairs(table_data) do
    for k, v in pairs(row) do
        io.write(k .. ": " .. v .. "\t")
>>>>>>> 00f74ea7fe2592c65001939b26274d53cfb372a3
    end
    io.write("\n")
end