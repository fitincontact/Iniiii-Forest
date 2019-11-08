--
-- Created by IntelliJ IDEA.
-- User: vsevolodfitin
-- Date: 08.11.2019
-- Time: 21:01
-- To change this template use File | Settings | File Templates.
--

Shape = Object:extend()

function Shape:new(x, y)
    self.x = x
    self.y = y
    self.speed = 100
end

function Shape:update(dt)
    self.x = self.x + self.speed * dt
end

