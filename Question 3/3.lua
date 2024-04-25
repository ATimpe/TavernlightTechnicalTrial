-- From the original code it seems like the intention of this function is to remove a player from a party
function removePartyMember(playerId, membername)
    -- 'player' is specific to this function so it can be local
    local player = Player(playerId)
    local party = player:getParty()

    for k,v in pairs(party:getMembers()) do
        -- change 'Player(membername)' to 'player' since them player object has already been called
        if v == player then
            party:removeMember(player)
            return true
        end
    end

    -- I thought it would make sense for a function like this to return true or false based on if the party member is in the party
    return false
end