--[[
    Place this file as well all the jump.otmod and jump.otui in the modules folder in a folder labeled 'jump'
]]

-- Declaring variables
jumpButton        = nil
jumpWindow        = nil
movingButton      = nil
maxPaddingBottom  = nil
maxPaddingRight   = nil
moveLeftInc       = nil
moveLeftTime      = nil
moveLeftCycle     = nil


function init()
    -- Initializes window and button
    jumpButton = modules.client_topmenu.addRightToggleButton('jumpButton', tr('Jump'), '/images/topbuttons/hotkeys', toggle)
    jumpButton:setOn(false)

    jumpWindow = g_ui.displayUI('jump')
    jumpWindow:setVisible(false)


    -- Connects button from jump.otui
    movingButton = jumpWindow:getChildById('movingButton')

    -- The values for the most the button can go up and left, based on the window dimentions subtracted by the buttons dimentions 
    -- (The -30 is so the top of the button doesn't extend part the clickable are of the window')
    maxPaddingBottom = jumpWindow:getHeight() - (movingButton:getHeight() + movingButton:getPaddingBottom() + movingButton:getPaddingTop()) - 30
    maxPaddingRight = jumpWindow:getWidth() - (movingButton:getWidth() + movingButton:getPaddingRight() + movingButton:getPaddingLeft())

    -- How much per tick the button is moved left
    moveLeftInc = 7

    -- Time in milisenconds to execute the moveLeft function
    moveLeftTime = 100
end

-- Taken from other modules
function terminate()
    jumpButton:destroy()
    jumpWindow:destroy()
    -- Stops looping event on terminate
    removeEvent(moveLeftCycle)
end

function Jump()
    -- Sets the botton back to the right and chooses a random height for the botton to be at
    movingButton:setMarginRight(0)
    movingButton:setMarginBottom(math.random(0, maxPaddingBottom))
end

function moveLeft()
    -- For every tick, the button is pushed more to the left
    movingButton:setMarginRight(movingButton:getMarginRight() + moveLeftInc)
    
    -- When the button touches the left part of the window, it resets
    if movingButton:getMarginRight() >= maxPaddingRight then
        Jump()
    end
end

function toggle()
    if jumpButton:isOn() then
        jumpWindow:setVisible(false)
        jumpButton:setOn(false)
        -- When toggled off, the cycle event is stopped
        removeEvent(moveLeftCycle)
    else
        jumpWindow:setVisible(true)
        jumpButton:setOn(true)
        -- Holds the value so that the event can be removed when toggled off
        moveLeftCycle = cycleEvent(moveLeft, moveLeftTime)
    end
end