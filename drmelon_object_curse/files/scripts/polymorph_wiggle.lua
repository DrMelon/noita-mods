dofile( "data/scripts/lib/utilities.lua" )
if not async then
    dofile( "data/scripts/lib/coroutines.lua" )
end

async_loop(function()
    local entity_id = GetUpdatedEntityID()

    wait(Random(30,100))
    jigglebox(entity_id)
end)

function jigglebox(entity_id)
    local dir_x = Random(-1, 1)
    local dir_y = Random(-1, 1)

    local len = math.sqrt((dir_x ^ 2)+(dir_y ^ 2))
    dir_x = dir_x / math.max(len, 0.01)
    dir_y = dir_y / math.max(len, 0.01)

    PhysicsApplyForce(entity_id, dir_x * 250, dir_y * 250)
end