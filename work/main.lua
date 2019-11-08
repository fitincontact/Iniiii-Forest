--! file: main.lua
function love.load()
    Object = require "library.classic"
    require "object.shape"
    require "object.rectangle"
    require "object.circle"

    r1 = Rectangle(100, 100, 200, 50, 100)
    r2 = Rectangle(0, 0, 25, 140, 33)
    c1 = Circle(10, 200, 18)
end

function love.update(dt)
    r1:update(dt)
    r2:update(dt)
    c1:update(dt)
end

function love.draw()
    r1:draw()
    r2:draw()
    c1:draw()
end

