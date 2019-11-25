MissNil = Object:extend()
MissFull = Object:extend()
Target = Object:extend()

function MissNil:new(x, y)
    self.image = love.graphics.newImage("image/sprite/static/missNil.png")
    self.x = x
    self.y = ELEMENT_Y

    self.width = self.image:getWidth()
    self.height = self.image:getHeight()
    --self.dead = false
end

function MissFull:new(x, y)
    self.image = love.graphics.newImage("image/sprite/static/missFull.png")
    self.x = x
    self.y = ELEMENT_Y

    self.width = self.image:getWidth()
    self.height = self.image:getHeight()
    --self.dead = false
end




