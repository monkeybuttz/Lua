-- read csv file and store in a table
-- Function to split a string by a separator
function split(str, sep)
    local result = {}
    local regex = "([^" .. sep .. "]+)"
    for part in string.gmatch(str, regex) do
        table.insert(result, part)
    end
    return result
end

-- Function to read CSV file and return a table
function read_csv(file_path)
    local data = {}
    local headers
    for line in io.lines(file_path) do
        if not headers then
            headers = split(line, "\t")
        else
            local row = {}
            local values = split(line, "\t")
            for i, value in ipairs(values) do
                row[headers[i]] = value
            end
            table.insert(data, row)
        end
    end
    return data, headers
end

-- Read CSV file and store the data in a table
local file_path = "data.csv"
local table_data, headers = read_csv(file_path)

-- Print the table
for _, row in ipairs(table_data) do
    for _, header in ipairs(headers) do
        io.write(header .. ": " .. row[header] .. "\t")
    end
    io.write("\n")
end