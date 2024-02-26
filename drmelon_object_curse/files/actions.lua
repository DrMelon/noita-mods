table.insert( actions,
{
	id          = "MLN_OBJECT_CURSE",
	name 		= "Object Curse",
	description = "Polymorph targets in the area into an inanimate objects.",
	sprite 		= "mods/drmelon_object_curse/files/ui_gfx/poly_object.png",
	type 		= ACTION_TYPE_PROJECTILE,
	spawn_level                       = "0,1,2,3,4,5,6", 
	spawn_probability                 = "1,1,1,1,1,1,1", 
	price = 100,
	mana = 50,
	max_uses = 8,
    action 		= function()
		add_projectile("mods/drmelon_object_curse/files/entities/object_poly_projectile.xml")
		c.fire_rate_wait = c.fire_rate_wait + 15
	end,
} )