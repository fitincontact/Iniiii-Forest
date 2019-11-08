--! file: rectangle.lua

-- Pass Object as first argument.
Rectangle = Object.extend(Object)

--math.randomseed(os.time())

function Rectangle.new(self, y)
    self.x = 100
    self.y = y
    self.width = 200
    self.height = 150
    self.speed = 100
end

function Rectangle.update(self, dt)
    self.x = self.x + self.speed * dt
end

function Rectangle.draw(self)
    love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
end

