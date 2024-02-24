table.insert( actions,
{
	id          = "MLN_EM_PETRIFY",
	name 		= "Touch of Stone",
	description = "Turns everything to stone in a radius... including you.",
	sprite 		= "mods/drmelon_earth_magic/files/gfx/ui/petrify_card.png",
	type 		= ACTION_TYPE_PROJECTILE,
	spawn_level                       = "2,3,4,5", 
	spawn_probability                 = "1,1,1,1", 
	price = 120,
	mana = 60,
	max_uses = 5,
	action 		= function()
		add_projectile("mods/drmelon_earth_magic/files/entities/petrify.xml")
		c.fire_rate_wait = c.fire_rate_wait + 3
	end,

	
} )

table.insert( actions,
{
	id          = "MLN_EM_STONE_FLESH",
	name 		= "Stone to Flesh",
	description = "A cure for petrification? Maybe not, but there are other uses for this.",
	sprite 		= "mods/drmelon_earth_magic/files/gfx/ui/stone_to_flesh.png",
	type 		= ACTION_TYPE_MODIFIER,
	spawn_level                       = "1,2,3,4", 
	spawn_probability                 = "1,1,1,1", 
	price = 80,
	mana = 15,
	action 		= function()
		c.extra_entities = c.extra_entities .. "mods/drmelon_earth_magic/files/entities/stone_to_meat.xml,data/entities/particles/tinyspark_red.xml,"
		c.fire_rate_wait = c.fire_rate_wait + 6
		draw_actions(1, true)
	end,	
} )

table.insert( actions,
{
	id          = "MLN_EM_SUMMON_VINE",
	name 		= "Summon Vine",
	description = "Come forth, vine and root! Skewer those who trespass!",
	sprite 		= "mods/drmelon_earth_magic/files/gfx/ui/single_vine.png",
	type 		= ACTION_TYPE_PROJECTILE,
	spawn_level                       = "1,2,3,4", 
	spawn_probability                 = "1,1,1,1", 
	price = 100,
	mana = 20,
	action 		= function()
		add_projectile("mods/drmelon_earth_magic/files/entities/individual_vine.xml")
		c.fire_rate_wait = c.fire_rate_wait + 3
	end,	
} )

table.insert( actions,
{
	id          = "MLN_EM_VINE_SHOT",
	name 		= "Vine Shot",
	description = "Vines burst outward from projectiles to attack enemies.",
	sprite 		= "mods/drmelon_earth_magic/files/gfx/ui/vine_shot.png",
	type 		= ACTION_TYPE_MODIFIER,
	spawn_level                       = "1,2,3,4", 
	spawn_probability                 = "1,1,1,1", 
	price = 150,
	mana = 35,
	action 		= function()
		c.extra_entities = c.extra_entities .. "mods/drmelon_earth_magic/files/entities/vine_shooter.xml,data/entities/particles/tinyspark_red.xml,"
		c.fire_rate_wait = c.fire_rate_wait + 6
		draw_actions(1, true)
	end,	
} )
