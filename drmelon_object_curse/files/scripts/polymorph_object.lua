dofile( "data/scripts/lib/utilities.lua" )

local entity_id = GetUpdatedEntityID()
local x, y = EntityGetTransform( entity_id )

local enemies = EntityGetWithTag( "destruction_target" )

if ( enemies ~= nil ) then
	for i,enemy_id in ipairs(enemies) do	
		local px, py = EntityGetTransform( enemy_id )
		distance = math.sqrt( ( x - px ) ^ 2 + ( y - py ) ^ 2 )
        if ( distance < 30 ) then           
            SetRandomSeed( px + 325, py - 235 )
            local opts = { "physics_minecart", "physics_box_explosive", "physics_barrel_oil" }
            local rnd = Random( 1, #opts )
            local opt = opts[rnd]

            EntityKill(enemy_id)
    
            local new_ent = EntityLoad("data/entities/props/" .. opt .. ".xml", px, py)
            EntityLoad("data/entities/particles/image_emitters/transmutation_effect.xml", px, py)
    
            EntityAddComponent(new_ent, "LuaComponent", {
                enable_coroutines="1",
                script_source_file="mods/drmelon_object_curse/files/scripts/polymorph_wiggle.lua",
                execute_on_added="1",
                execute_every_n_frame="-1",
                execute_times="1"
            })

            
    
        end
        
    end
    
end