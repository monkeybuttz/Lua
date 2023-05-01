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
    file:close()
    return table_data, headers
end

-- Read CSV file and store the data in a table
local file_path = "data.csv"
local table_data, headers = read_csv(file_path)

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
    end
    io.write("\n")
end