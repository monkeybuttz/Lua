-- sort an array of 10 integers

function sortArray(array)
    local size = #array
    for i = 1, size do
        for j = i + 1, size do
        if array[i] > array[j] then
            array[i], array[j] = array[j], array[i]
        end
        end
    end
end

    print("enter 10 numbers:")
    array = {}
    for i = 1, 10 do
        array[i] = io.read("*number")
    end

    print("\nThe numbers in unsorted order are: ")
    for i=1,10 do
        print(array[i])
    end

    sortArray(array)
    print("\nThe numbers in sorted order are: ")
    for i=1,10 do
        print(array[i])
    end


