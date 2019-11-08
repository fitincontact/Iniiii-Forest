--
-- Created by IntelliJ IDEA.
-- User: vsevolodfitin
-- Date: 08.11.2019
-- Time: 21:19
-- To change this template use File | Settings | File Templates.
--

--! file: circle.lua
Circle = Shape:extend()

function Circle:new(x, y, radius)
    Circle.super.new(self, x, y)
    --A circle doesn't have a width or height. It has a radius.
    self.radius = radius
end

function Circle:draw()
    love.graphics.circle("line", self.x, self.y, self.radius)
end

