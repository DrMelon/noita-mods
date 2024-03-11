dofile( "data/scripts/lib/utilities.lua" )
if not async then
    dofile( "data/scripts/lib/coroutines.lua" )
end

async(function()
    local entity_id = GetUpdatedEntityID()

    wait(Random(30,100))
    jigglebox(entity_id)

    wait(Random(30,100))
    jigglebox(entity_id)

    wait(Random(30,100))
    jigglebox(entity_id)

    wait(Random(30,100))
    jigglebox(entity_id)

    wait(Random(30,100))
    jigglebox(entity_id)

    wait(Random(30,100))
    jigglebox(entity_id)

    wait(Random(30,100))

    local x, y = EntityGetTransform( entity_id )

    local components = EntityGetComponent( entity_id, "VariableStorageComponent" )

    for i,comp_id in ipairs(components) do 
        local var_name = ComponentGetValue( comp_id, "name" )
		if( var_name == "old_enemy_ent") then
            local load_me = ComponentGetValue( comp_id, "value_string" )
			deserialize_entity(load_me, x, y)
		end
	end

    EntityApplyTransform(entity_id, 6666666, 6666666)
    EntityKill(entity_id)
    EntityLoad("data/entities/particles/image_emitters/transmutation_effect.xml", x, y)
end)

function jigglebox(entity_id)
    local dir_x = Random(-1, 1)
    local dir_y = Random(-1, 1)

    local len = math.sqrt((dir_x ^ 2)+(dir_y ^ 2))
    dir_x = dir_x / math.max(len, 0.01)
    dir_y = dir_y / math.max(len, 0.01)

    PhysicsApplyForce(entity_id, dir_x * 250, dir_y * 250)
end

function deserialize_entity(str, x, y)
    if not coroutine.running() then
        error("deserialize_entity() must be called from inside an async function", 2)
    end
	local polytools = dofile_once("mods/drmelon_object_curse/files/polytools/polytools.lua")
    -- Move the entity to a unique location so that we can get a reference to the entity with EntityGetInRadius once polymorph wears off
    -- Apply polymorph which, when it runs out after 1 frame will turn the entity back into it's original form, which we provide
    return polytools.spawn(x, y, str)
end