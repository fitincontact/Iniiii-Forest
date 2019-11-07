--
-- Created by IntelliJ IDEA.
-- User: vsevolodfitin
-- Date: 06.11.2019
-- Time: 13:56
-- To change this template use File | Settings | File Templates.
--

local test = 20

function some_function(test)
    if true then
        local test = 40
        print(test)
        --Output: 40
    end
    print(test)
    --Output: 30
end

some_function(30)

print(test)
--Output: 20

