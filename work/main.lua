function love.load()
    Object = require "library.classic"

    require "global"
    require "object.player"
    require "object.enemy"
    require "object.bullet"

    dice = false

    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT,
        { resizable = true, vsync = false, minwidth = WINDOW_WIDTH, minheight = WINDOW_HEIGHT })

    local joysticks = love.joystick.getJoysticks()
    joystick = joysticks[1]

    love.mouse.setVisible(not love.mouse.isVisible())

    image = love.graphics.newImage("image/sprite/dynamic/Dice.png")
    local width = image:getWidth()
    local height = image:getHeight()
    frames = {}
    local frame_width = 318
    local frame_height = 238
    for i = 0, 4 do
        table.insert(frames, love.graphics.newQuad(i * frame_width, 0, frame_width, frame_height, width, height))
    end
    currentFrame = 1

end

function love.update(dt)

    if joystick then

        if joystick:isGamepadDown("dpleft") or
                joystick:isGamepadDown("dpright") or
                joystick:isGamepadDown("dpup") or
                joystick:isGamepadDown("dpdown") or
                joystick:isGamepadDown("a") or
                joystick:isGamepadDown("b") or
                joystick:isGamepadDown("x") or
                joystick:isGamepadDown("y") then
            dice = not dice
        end

    end

    if dice then
        math.randomseed(os.time())
        r = math.random(6, 9)

        currentFrame = currentFrame + r * dt
        if currentFrame >= 6 then
            currentFrame = 1
        end
    end
end

function love.keypressed(key)
    --If the spacebar is pressed
    if key == "space" then
        --player:fire()
        dice = not dice
        rr = math.random(6, 9)
        --print(rr)
    end
    if key == 'q' then
        love.event.quit()
    end
end

function love.draw()

    --    player:draw()
    --    enemy:draw()
    --
    --    for _, bullet in ipairs(listOfBullets) do
    --        bullet:draw()
    --    end
    --love.graphics.draw(image, frames[1], 0, 0)
    love.graphics.draw(image, frames[math.floor(currentFrame)], 0, 0)
end