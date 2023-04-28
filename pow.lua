-- defines a power function
    function power (n, m)
        if m == 0 then
            return 1
        else
          return n * power(n, m-1)
        end
      end
          
        print("enter a number:")
        a = io.read("*number1")        -- read a number
        print("enter a second number:")
        b = io.read("*number2")        -- read a second number
        print("\n".. a .. " to the power of " .. b .. " is " .. power(a,b))