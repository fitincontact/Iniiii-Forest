function love.load()
    Object = require "library.classic"

    require "global"
    require "object.player"
    require "object.enemy"
    require "object.bullet"

    --love.graphics.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, false, true, 0)
    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT,
        { resizable = true, vsync = false, minwidth = WINDOW_WIDTH, minheight = WINDOW_HEIGHT })

    player = Player()
    enemy = Enemy()
    listOfBullets = {}

    local joysticks = love.joystick.getJoysticks()
    joystick = joysticks[1]

    love.mouse.setVisible(not love.mouse.isVisible())
end

function love.update(dt)

    if joystick then

        if joystick:isGamepadDown("dpleft") then
            player:leftMove(dt)
        end

        if joystick:isGamepadDown("dpright") then
            player:rightMove(dt)
        end

        if joystick:isGamepadDown("dpup") then
            player:uptMove(dt)
        end

        if joystick:isGamepadDown("dpdown") then
            player:downMove(dt)
        end
    end

    player:update(dt)
    enemy:update(dt)

    for i, bullet in ipairs(listOfBullets) do
        bullet:update(dt)
        bullet:checkCollision(enemy)

        --If the bullet has the property dead and it's true then..
        if bullet.dead then
            --Remove it from the list
            table.remove(listOfBullets, i)
        end
    end

end

function love.keypressed(key)
    --If the spacebar is pressed
    if key == "space" then
        player:fire()
    end
    if key == 'q' then
        love.event.quit()
    end
end

function love.draw()

    player:draw()
    enemy:draw()

    for _, bullet in ipairs(listOfBullets) do
        bullet:draw()
    end

end