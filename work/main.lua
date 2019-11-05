--[[function love.draw()
    love.graphics.print("Hello World", 40, 30)
	--love.graphics.circle("fill", 10, 10, 100, 25)
	--love.graphics.rectangle("line", 1, 1, 318, 238)
end
]]

function love.load()
    x = 100
end

function love.update(dt)
    print(dt)
    if love.keyboard.isDown("right") then
        x = x + 100 * dt

    else
        x = x - 100 * dt --We decrease the value of x
    end
end

function love.draw()
    love.graphics.rectangle("line", x, 50, 200, 150)
    love.graphics.rectangle("line", 1, 1, 300, 300)
    if love.keyboard.isDown("right") then
        love.graphics.print("right", 40, 30)
    end
end
	