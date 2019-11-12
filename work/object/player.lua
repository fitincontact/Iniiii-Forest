require "global"

Player = Object:extend()

function Player:new()
    self.image = love.graphics.newImage("image/sprite/static/panda.png")
    self.x = WINDOW_WIDTH / 2
    self.y = WINDOW_HEIGHT / 20
    self.speed = 500
    self.width = self.image:getWidth()
    self.right = false
    self.left = false
end

function Player:leftMove(dt)
    self.x = self.x - self.speed * dt
    player:xBorder()
end

function Player:rightMove(dt)
    self.x = self.x + self.speed * dt
    player:xBorder()
end

function Player:xBorder()
    --If the left side is too far too the left then..
    if self.x < 0 then
        --Set x to 0
        self.x = 0

        --Else, if the right side is too far to the right then..
    elseif self.x + self.width > WINDOW_WIDTH then
        --Set the right side to the window's width.
        self.x = WINDOW_WIDTH - self.width
    end
end

function Player:update(dt)
    if love.keyboard.isDown("left") --[[or DPLEFT == true]]
    --or (joystickand and joystick:isGamepadDown("dpleft"))
    then
        self.x = self.x - self.speed * dt
    elseif love.keyboard.isDown("right") --[[or DPRIGHT == true]] then
        self.x = self.x + self.speed * dt
    end

    --If the left side is too far too the left then..
    if self.x < 0 then
        --Set x to 0
        self.x = 0

        --Else, if the right side is too far to the right then..
    elseif self.x + self.width > WINDOW_WIDTH then
        --Set the right side to the window's width.
        self.x = WINDOW_WIDTH - self.width
    end
end

function Player:draw()
    love.graphics.draw(self.image, self.x, self.y)
end

function Player:fire()
    --Put a new instance of Bullet inside listOfBullets.
    table.insert(listOfBullets, Bullet(self.x, self.y))
end