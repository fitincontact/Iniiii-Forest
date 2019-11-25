require "global"

Player = Object:extend()

function Player:new()
    self.image = love.graphics.newImage("image/sprite/static/panda.png")
    self.x = WINDOW_WIDTH / 2
    self.y = WINDOW_HEIGHT / 20
    self.speed = 500
    self.width = self.image:getWidth()
    self.heigh = self.image:getHeight()
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

function Player:downMove(dt)
    self.y = self.y + self.speed * dt
    player:yBorder()
end

function Player:upMove(dt)
    self.y = self.y - self.speed * dt
    player:yBorder()
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

function Player:yBorder()
    --If the left side is too far too the left then..
    if self.y < 0 then
        --Set x to 0
        self.y = 0

        --Else, if the right side is too far to the right then..
    elseif self.y + self.width > WINDOW_HEIGHT then
        --Set the right side to the window's width.
        self.y = WINDOW_HEIGHT - self.width
    end
end

function Player:update(dt)
    if love.keyboard.isDown("left")
    then
        player:leftMove(dt)
    elseif love.keyboard.isDown("right") then
        player:rightMove(dt)
    elseif love.keyboard.isDown("up") then
        player:upMove(dt)
    elseif love.keyboard.isDown("down") then
        player:downMove(dt)
    end

    player:xBorder()
end

function Player:draw()
    love.graphics.draw(self.image, self.x, self.y)
end

function Player:fire()
    --Put a new instance of Bullet inside listOfBullets.
    table.insert(listOfBullets, Bullet(self.x, self.y))
end