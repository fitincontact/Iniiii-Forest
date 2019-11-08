--! file: main.lua
function love.load()
    Object = require "library.classic"
    --Don't forget to load the file
    require "rectangle"

    r1 = Rectangle()
    r2 = Rectangle()
    print(r1.test, r2.test)
end