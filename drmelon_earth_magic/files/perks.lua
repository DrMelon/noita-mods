table.insert( perk_list, 
    {
        id = "MLN_EM_BLEED_FUNGUS",
        ui_name = "$perk_fungus_blood",
        ui_description = "$perk_desc_fungus_blood",
        ui_icon = "mods/drmelon_earth_magic/files/gfx/ui/bleed_fungus_sm.png",
        perk_icon = "mods/drmelon_earth_magic/files/gfx/ui/bleed_fungus.png",
		game_effect = "HEALING_BLOOD",
        func = function( entity_perk_item, entity_who_picked, item_name )
        
            local damagemodels = EntityGetComponent( entity_who_picked, "DamageModelComponent" )
            if( damagemodels ~= nil ) then
                for i,damagemodel in ipairs(damagemodels) do
                    ComponentSetValue( damagemodel, "blood_material", "fungi" )
                    ComponentSetValue( damagemodel, "blood_spray_material", "mushroom_seed" )
                    ComponentSetValue( damagemodel, "blood_multiplier", "3.0" )
                    ComponentSetValue( damagemodel, "blood_sprite_directional", "data/particles/bloodsplatters/bloodsplatter_directional_oil_$[1-3].xml" )
                    ComponentSetValue( damagemodel, "blood_sprite_large", "data/particles/bloodsplatters/bloodsplatter_oil_$[1-3].xml" )
                end
            end

            GamePrint("You feel your organs change subtly...")
        end,
    }

)

table.insert( perk_list, 
    {
        id = "MLN_EM_VINES",
        ui_name = "$perk_strangling_vines",
        ui_description = "$perk_desc_strangling_vines",
        ui_icon = "mods/drmelon_earth_magic/files/gfx/ui/vines_sm.png",
        perk_icon = "mods/drmelon_earth_magic/files/gfx/ui/vines.png",
        func = function( entity_perk_item, entity_who_picked, item_name )
            
        EntityAddComponent(entity_who_picked, "LuaComponent",
        {
            execute_every_n_frame="45",
            script_source_file="mods/drmelon_earth_magic/files/scripts/vines.lua"
        })

        GamePrint("Your skin begins to turn green...")
            
        end
    })