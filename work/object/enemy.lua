require "global"

Enemy = Object:extend()

function Enemy:new()
    self.image = love.graphics.newImage("image/sprite/static/snake.png")
    self.x = window_width/2
    self.y = window_height - window_height/5
    self.speed = 100
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()
end

function Enemy:update(dt)
    self.x = self.x + self.speed * dt

    if self.x < 0 then
        self.x = 0
        self.speed = -self.speed
    elseif self.x + self.width > window_width then
        self.x = window_width - self.width
        self.speed = -self.speed
    end
end

function Enemy:draw()
    love.graphics.draw(self.image, self.x, self.y)
end
