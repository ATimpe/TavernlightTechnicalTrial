function printSmallGuildNames(memberCount)
-- this method is supposed to print names of all guilds that have less than memberCount max members
    local selectGuildQuery = "SELECT name FROM guilds WHERE max_members < %d;"
    local resultId = db.storeQuery(string.format(selectGuildQuery, memberCount))

    -- Incorrect variable name, should be 'resultId' and not 'result'
    local guildNames = resultId.getString("name")

    -- Prints out the names in an nicer format
    for name in guildNames do
        print(name .. '\n')
    end
end