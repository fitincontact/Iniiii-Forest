--in main
local gam_label = "no gamepad event so far"
local joy_label = "no joystick event so far"
local joy = nil  -- joystick reference
function love.gamepadpressed(joystick, button)
    -- button here has a name
    gam_label = "gamepad pressed: " .. tostring(button)
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
-- generate our y position dynamically, cuz lazy =B
local make_get_y = function(init)
    local co = coroutine.create(function()
        while true do
            coroutine.yield(init)
            init = init + 20
        end
    end)
    return function()
        local rs, v = coroutine.resume(co)
        return v
    end
end
function love.draw()
    local get_y = make_get_y(10)

    if joy ~= nil then
        -- has auto mapping as a gamepad?
        love.graphics.printf("is gamepad: " .. tostring(joy:isGamepad()), 10, get_y(), 200)
        love.graphics.printf(joy_label, 10, get_y(), 300)
        love.graphics.printf(gam_label, 10, get_y(), 300)
        -- left stick
        love.graphics.printf("axis leftx: " .. tostring(joy:getGamepadAxis("leftx")), 10, get_y(), 200)
        love.graphics.printf("axis lefty: " .. tostring(joy:getGamepadAxis("lefty")), 10, get_y(), 200)
        -- right stick
        love.graphics.printf("axis rightx: " .. tostring(joy:getGamepadAxis("rightx")), 10, get_y(), 200)
        love.graphics.printf("axis righty: " .. tostring(joy:getGamepadAxis("righty")), 10, get_y(), 200)
        -- popularly called L2
        love.graphics.printf("axis triggerleft: " .. tostring(joy:getGamepadAxis("triggerleft")), 10, get_y(), 200)
        -- popularly called R2
        love.graphics.printf("axis triggerright: " .. tostring(joy:getGamepadAxis("triggerright")), 10, get_y(), 200)
    end
end