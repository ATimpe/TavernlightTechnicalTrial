-- I think it would make more sense to pass in an id value for what storage to release rather than hardcoding it
local function releaseStorage(storageId, player)
    player:setStorageValue(storageId, -1)
end

function onLogout(player)
    if player:getStorageValue(1000) == 1 then
        -- The addEvent function would make the event happen in 1000 miliseconds which I think is a mistake
        releaseStorage(1000, player)
    end
    return true
end