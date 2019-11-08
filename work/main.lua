--! file: main.lua
function love.load()
    Object = require "library.classic"
    require "rectangle"
    r1 = Rectangle(10)
    r2 = Rectangle(200)
end

function love.update(dt)
    r1.update(r1, dt)
    r2.update(r2, dt)
end

function love.draw()
    r1.draw(r1)
    r2.draw(r2)
end