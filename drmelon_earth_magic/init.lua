function OnModPreInit()
	print("Mod - OnModPreInit()") -- first this is called for all mods
end

function OnModInit()
	print("Mod - OnModInit()") -- after that this is called for all mods
end

function OnModPostInit()
	print("Mod - OnModPostInit()") -- then this is called for all mods
end

function OnPlayerSpawned( player_entity ) -- this 
    
end


-- this code runs when all mods' filesystems are registered
ModLuaFileAppend( "data/scripts/gun/gun_actions.lua", "mods/drmelon_earth_magic/files/actions.lua" )
ModLuaFileAppend( "data/scripts/perks/perk_list.lua", "mods/drmelon_earth_magic/files/perks.lua")

-- localisation keys
local content = ModTextFileGetContent("data/translations/common.csv")
ModTextFileSetContent("data/translations/common.csv", content .. [[
perk_fungus_blood, Fungal Blood,,,,,,,,,,,,,
perk_desc_fungus_blood, Fill your veins with fungal spores. Feed on decay.,,,,,,,,,,,,,
perk_strangling_vines, Strangling Vines,,,,,,,,,,,,,
perk_desc_strangling_vines, Vines burst forth from your skin to attack your foes.,,,,,,,,,,,,,
]])