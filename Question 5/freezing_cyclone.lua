--[[
	Place this file inside of data/spells/scripts/custom

	Paste this into your spells.xml file:
	<instant group="attack" spellid="400" name="Freezing Cyclone" words="frigo" level="80" mana="1400" premium="0" selftarget="1" cooldown="45000" groupcooldown="4500" needlearn="0" script="custom/freezing_cyclone.lua">
		<vocation name="Druid" />
		<vocation name="Elder Druid" />
]]

-- Initilizes the combat areas that will be used
COMBAT_AREA_START = {
	{0, 0, 0, 0, 0, 0, 0},
	{0, 1, 0, 0, 0, 0, 0},
	{0, 1, 1, 0, 0, 0, 0},
	{1, 1, 1, 3, 0, 0, 0},
	{0, 1, 1, 1, 1, 1, 0},
	{0, 1, 1, 1, 1, 0, 0},
	{0, 0, 0, 1, 0, 0, 0}
}

COMBAT_AREA1 = {
	{0, 0, 0, 0, 1, 0, 0},
	{0, 0, 0, 1, 1, 1, 0},
	{0, 0, 1, 1, 1, 1, 1},
	{0, 0, 1, 3, 1, 1, 1},
	{0, 1, 1, 1, 1, 1, 0},
	{0, 0, 1, 1, 1, 0, 0},
	{0, 0, 0, 1, 0, 0, 0}
}

COMBAT_AREA2 = {
	{0, 0, 0, 0, 1, 0, 0},
	{0, 0, 1, 1, 1, 0, 0},
	{0, 0, 1, 1, 1, 1, 0},
	{0, 1, 1, 3, 1, 1, 1},
	{0, 1, 1, 1, 1, 1, 1},
	{0, 0, 0, 1, 0, 0, 0},
	{0, 0, 0, 0, 0, 0, 0}
}

COMBAT_AREA3 = {
	{0, 0, 0, 0, 1, 0, 0},
	{0, 0, 1, 1, 1, 1, 0},
	{0, 1, 1, 1, 1, 1, 1},
	{0, 1, 1, 3, 1, 1, 1},
	{0, 0, 0, 0, 0, 1, 0},
	{0, 0, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 0, 0}
}

COMBAT_AREA4 = {
	{0, 0, 1, 0, 1, 0, 0},
	{0, 0, 1, 1, 1, 1, 0},
	{0, 1, 1, 1, 1, 1, 0},
	{1, 1, 1, 3, 1, 1, 1},
	{0, 1, 1, 1, 1, 1, 0},
	{0, 0, 1, 1, 1, 0, 0},
	{0, 0, 0, 1, 0, 0, 0}
}



-- First frame of combat
local combatStart = Combat()
combatStart:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
combatStart:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ICETORNADO)
combatStart:setArea(createCombatArea(COMBAT_AREA_START))

function onGetFormulaValues(player, level, magicLevel)
	local min = (level / 5) + (magicLevel * 6) + 10
	local max = (level / 5) + (magicLevel * 12) + 30
	return -min, -max
end

combatStart:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

-- For each part of the spell, I made a different combat variable to be executed a set amount of miliseconds from casting the spell
local combat1 = Combat()
-- From the spell words and the sprites used, Ice Damage made the most sense
combat1:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
combat1:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ICETORNADO)
combat1:setArea(createCombatArea(COMBAT_AREA1))

-- Kept getting a warning that onGetFormulaValues could not be found when setting it to multiple callbacks. Found it stopped when I had multiple of these functions
-- There's probably a better way to fix it but I couldn't find it
function onGetFormulaValues(player, level, magicLevel)
	local min = (level / 5) + (magicLevel * 6) + 10
	local max = (level / 5) + (magicLevel * 12) + 30
	return -min, -max
end

combat1:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local combat2 = Combat()
combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
combat2:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ICETORNADO)
combat2:setArea(createCombatArea(COMBAT_AREA2))

function onGetFormulaValues(player, level, magicLevel)
	local min = (level / 5) + (magicLevel * 6) + 10
	local max = (level / 5) + (magicLevel * 12) + 30
	return -min, -max
end

combat2:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local combat3 = Combat()
combat3:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
combat3:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ICETORNADO)
combat3:setArea(createCombatArea(COMBAT_AREA3))

function onGetFormulaValues(player, level, magicLevel)
	local min = (level / 5) + (magicLevel * 6) + 10
	local max = (level / 5) + (magicLevel * 12) + 30
	return -min, -max
end

combat3:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local combat4 = Combat()
combat4:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
combat4:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ICETORNADO)
combat4:setArea(createCombatArea(COMBAT_AREA4))

function onGetFormulaValues(player, level, magicLevel)
	local min = (level / 5) + (magicLevel * 6) + 10
	local max = (level / 5) + (magicLevel * 12) + 30
	return -min, -max
end

combat4:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

-- Could be much better but this is the only way I was able to find that let me execute a combat variable after a set time
function combatFrame(frame, creature, variant)
	if frame == 1 then
		combat1:execute(creature, variant)
	elseif frame == 2 then
		combat2:execute(creature, variant)
	elseif frame == 3 then
		combat3:execute(creature, variant)
	elseif frame == 4 then
		combat4:execute(creature, variant)
	end
end

function onCastSpell(creature, variant)
	-- The time in miliseconds between each part of the spell being executed
	local frameTime = 500
	combatStart:execute(creature, variant)
	-- Adds the events for the other parts of the spell
	addEvent(combatFrame, frameTime, 1, creature, variant)
	addEvent(combatFrame, frameTime * 2, 2, creature, variant)
	addEvent(combatFrame, frameTime * 3, 3, creature, variant)
	addEvent(combatFrame, frameTime * 4, 4, creature, variant)
	return
end
