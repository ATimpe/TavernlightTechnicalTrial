void Game::addItemToPlayer(const std::string& recipient, uint16_t itemId)
{
    // Since there is a possibility that player will point to an existing value or point to a new value, I set a bool to tell
    // later parts of the function which it is so it can either delete the pointer or set the pointer to nullptr
    bool newPlayer = false;
    Player* player = g_game.getPlayerByName(recipient);
    if (!player) {
        player = new Player(nullptr);
        newPlayer = true;
        if (!IOLoginData::loadPlayerByName(player, recipient)) {
            // Deletes the newly allocated memory
            delete player;
            return;
        }
    }

    Item* item = Item::CreateItem(itemId);
    if (!item) {
        // If the player variable is from newly allocated memory, delete it. Otherwise reset the pointer
        if (newPlayer) delete player;
        else player = nullptr;
        return;
    }

    g_game.internalAddItem(player->getInbox(), item, INDEX_WHEREEVER, FLAG_NOLIMIT);

    if (player->isOffline()) {
        IOLoginData::savePlayer(player);
    }

    // Same as line 19
    if (newPlayer) delete player;
    else player = nullptr;
}