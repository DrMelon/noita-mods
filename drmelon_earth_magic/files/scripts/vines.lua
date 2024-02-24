dofile( "data/scripts/lib/utilities.lua" )

-- up to 6 vines lash out randomly if targets nearby
local entity_id = GetUpdatedEntityID()
local px, py = EntityGetTransform( entity_id )
local enemies = EntityGetWithTag( "destruction_target" )

local num_close_enemies = 0
local close_enemies = {}



if(enemies ~= nil) then
	for i,enemy_id in ipairs(enemies) do
        local ex, ey = EntityGetTransform( enemy_id )

        local dist = math.sqrt((( px - ex )*( px - ex )) + (( py - ey )*( py - ey )))
        if ( dist < 50 and num_close_enemies < 6 ) then
            close_enemies[num_close_enemies] = {
                x = ex, 
                y = ey
            }
            num_close_enemies = num_close_enemies + 1
		end
    end
    
end

if(num_close_enemies > 0) then
    for i,enemy in pairs(close_enemies) do
        -- shoot a tentacle at that enemy
        local ex = enemy.x
        local ey = enemy.y
        shoot_projectile( entity_id, "mods/drmelon_earth_magic/files/entities/individual_vine.xml", px, py, ex - px, ey - py )
    end
end