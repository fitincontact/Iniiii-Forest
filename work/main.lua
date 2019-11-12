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
end

--
local gam_label = "no gamepad event so far"
local joy_label = "no joystick event so far"
local joy = nil -- joystick reference

function love.gamepadpressed(joystick, button)
    -- button here has a name
    gam_label = "gamepad pressed: " .. tostring(button)
    if button == "dpleft" then DPLEFT = true end
    if button == "dpright" then DPRIGHT = true end
    if button == "dpup" then DPUP = true end
    if button == "dpdown" then DPDOWN = true end

    if button == "a" then A = true end
    if button == "b" then
        B = true
        player:fire()
    end
    if button == "x" then X = true end
    if button == "y" then Y = true end

    if button == "start" then
        START = true
        love.event.quit()
    end
    if button == "back" then BACK = true end

    if button == "leftshoulder" then LEFTSHOULDER = true end
    if button == "rightshoulder" then RIGHTSHOULDER = true end
end

function love.gamepadreleased(joystick, button)
    -- button here has a name
    gam_label = "gamepad released: " .. tostring(button)
end

function love.joystickpressed(joystick, button)
    -- button here has a code
    joy_label = "joystick pressed: " .. tostring(button)
end

function love.joystickreleased(joystick, button)
    -- button here has a code
    joy_label = "joystick released: " .. tostring(button)
end

function love.joystickadded(joystick)
    -- as named ;)
    joy_label = "joystick added: " .. joystick:getName()
    joy = joystick
end

function love.joystickremoved(joystick)
    -- as named ;)
    joy_label = "joystick removed: " .. joystick:getName()
    joy = nil
end

--
function love.update(dt)
    --[[    if joystick then

            if joystick:isGamepadDown("dpleft") then
                player:left(dt)
            elseif joystick:isGamepadDown("dpright") then
                player:right(dt)
            end
        end]]
    if joystick then
        if joystick:isGamepadDown("dpleft") then
            player:leftMove(dt)
        end
        if joystick:isGamepadDown("dpright") then
            player:rightMove(dt)
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

    DPLEFT = false
    DPRIGHT = false
    DPUP = false
    DPDOWN = false

    A = false
    B = false
    X = false
    Y = false

    START = false
    BACK = false

    LEFTSHOULDER = false
    RIGHTSHOULDER = false
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

    if joy ~= nil then
        -- has auto mapping as a gamepad?
        love.graphics.printf("is gamepad: " .. tostring(joy:isGamepad()), 10, 20, 200)
        love.graphics.printf(joy_label, 10, 30, 300)
        love.graphics.printf(gam_label, 10, 40, 300)
    end
    --love.graphics.printf("key:  "..k, 10, 50, 300)
    love.graphics.printf("gamepad pressed2 " .. tostring(DPRIGHT), 10, 10, 300)
    player:draw()
    enemy:draw()

    for _, bullet in ipairs(listOfBullets) do
        bullet:draw()
    end
end

--

--[[function love.draw()
    love.graphics.printf("joystickpressed2 "..tostring(dpright), 10, 10, 300)
    player:draw()
    enemy:draw()

    for _, bullet in ipairs(listOfBullets) do
        bullet:draw()
    end
end]]

