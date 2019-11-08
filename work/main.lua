function love.load()
    myImage = love.graphics.newImage("image/sprite/dynamic/hero_01_00.png")
    width = myImage:getWidth()
    height = myImage:getHeight()
    love.graphics.setBackgroundColor(1, 1, 1)
end
--[[function love.draw()

    love.graphics.draw(myImage, 100, 100)
    love.graphics.draw(myImage, 100, 100, 10)
    love.graphics.draw(myImage, 100, 100, 0, 2, 2)
    love.graphics.draw(myImage, 100, 100, 0, -1, 1)
    love.graphics.draw(myImage, 100, 100, 0, 2, 2, 39, 50)
    --love.graphics.draw(myImage, 100, 100, 0, 2, 2, 39, 50, 15, 20)
    love.graphics.draw(myImage, 100, 100, 0, 2, 2, width/2, height/2)
end]]

function love.draw()
    love.graphics.setColor(255/255, 200/255, 40/255, 127/255)
    love.graphics.setColor(1, 0.78, 0.15, 0.5)
    -- Or ...
    love.graphics.draw(myImage, 100, 100)
    -- Not passing an argument for alpha automatically sets it to 1 again.
    love.graphics.setColor(1, 1, 1)
    love.graphics.draw(myImage, 200, 100)
end