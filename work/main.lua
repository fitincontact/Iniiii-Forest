function love.load()
    Object = require "library.classic"
    require "object.player"
    require "object.enemy"
    require "object.bullet"

    --love.graphics.setMode(window_width, window_height, false, true, 0)
    love.window.setMode(window_width, window_height, {resizable=true, vsync=false, minwidth=window_width, minheight=window_height})

    player = Player()
    enemy = Enemy()
    listOfBullets = {}
end

function love.update(dt)
    player:update(dt)
    enemy:update(dt)

    for i,bullet in ipairs(listOfBullets) do
        bullet:update(dt)
        bullet:checkCollision(enemy)

        --If the bullet has the property dead and it's true then..
        if bullet.dead then
            --Remove it from the list
            table.remove(listOfBullets, i)
        end
    end
end

function love.draw()
    player:draw()
    enemy:draw()

    for _, bullet in ipairs(listOfBullets) do
        bullet:draw()
    end
end

function love.keypressed(key)
    player:keyPressed(key)
end