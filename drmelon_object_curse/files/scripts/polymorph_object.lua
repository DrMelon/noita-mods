dofile( "data/scripts/lib/utilities.lua" )
if not async then
    dofile( "data/scripts/lib/coroutines.lua" )
end

async(function()
    wait(1)
    local entity_id = GetUpdatedEntityID()
    local x, y = EntityGetTransform( entity_id )

    local enemies = EntityGetWithTag( "destruction_target" )

    if ( enemies ~= nil ) then
        for i,enemy_id in ipairs(enemies) do	
            local px, py = EntityGetTransform( enemy_id )
            distance = math.sqrt( ( x - px ) ^ 2 + ( y - py ) ^ 2 )
            if ( distance < 30 ) then           
                SetRandomSeed( px + 325, py - 235 )
                local opts = { "physics_minecart", "physics_box_harmless", "physics_cart", "physics_box_explosive", "physics_barrel_oil" }
                local rnd = Random( 1, #opts )
                local opt = opts[rnd]

        
                local new_ent = EntityLoad("data/entities/props/" .. opt .. ".xml", px, py)
                EntityLoad("data/entities/particles/image_emitters/transmutation_effect.xml", px, py)
        
                

                EntityAddComponent(new_ent, "VariableStorageComponent", 
                {
                    name = "old_enemy_ent",
                    value_string = serialize_entity(enemy_id)
                })

                EntityAddComponent(new_ent, "LuaComponent", {
                    enable_coroutines="1",
                    script_source_file="mods/drmelon_object_curse/files/scripts/polymorph_return.lua",
                    execute_on_added="1",
                    execute_every_n_frame="-1",
                    execute_times="1"
                })        
            end
        end
    end
end)

function serialize_entity(entity)
    if not coroutine.running() then
        error("serialize_entity() must be called from inside an async function", 2)
    end
	local polytools = dofile_once("mods/drmelon_object_curse/files/polytools/polytools.lua")
    EntityRemoveFromParent(entity)
    EntityApplyTransform(entity, 6666666, 6666666)
    local serialized = polytools.save(entity)
    wait(0)
    entity = EntityGetInRadius(6666666, 6666666, 5)[1]
    EntityKill(entity)
    return serialized
end