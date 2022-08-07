local S = df_underworld_items.S

local invulnerable = df_underworld_items.config.invulnerable_slade and not minetest.settings:get_bool("creative_mode")

local server_diggable_only = function(pos, player)
	if player then
		return minetest.check_player_privs(player, "server")
	end
	return false
end

local add_immortality = function(slade_def)
	slade_def.groups.immortal = 1
	slade_def.can_dig = server_diggable_only
	slade_def._mcl_blast_resistance = 3600000
	slade_def._mcl_hardness = -1
	return slade_def
end

local slade_def = {
	description = S("Slade"),
	_doc_items_longdesc = df_underworld_items.doc.slade_desc,
	_doc_items_usagehelp = df_underworld_items.doc.slade_usage,
	tiles = {"dfcaverns_slade.png"},
	groups = {cracky=3, stone=1, level=3, slade=1, pit_plasma_resistant=1, mese_radiation_shield=1},
	sounds = df_underworld_items.sounds.slade,
	is_ground_content = false,
	_mcl_blast_resistance = 1200,
	_mcl_hardness = 50,
	on_blast = function(pos, intensity)
		if intensity > 3.0 then
			minetest.set_node(pos, {name="df_underworld_items:slade_sand"})
			minetest.check_for_falling(pos)
		end
	end,
}
if invulnerable then
	add_immortality(slade_def)
end
minetest.register_node("df_underworld_items:slade", slade_def)

local slade_brick_def = {
	description = S("Slade Brick"),
	_doc_items_longdesc = df_underworld_items.doc.slade_desc,
	_doc_items_usagehelp = df_underworld_items.doc.slade_usage,
	tiles = {"dfcaverns_slade_brick.png"},
	groups = { cracky=3, stone=1, level=3, slade=1, pit_plasma_resistant=1, mese_radiation_shield=1},
	sounds = df_underworld_items.sounds.slade,
	is_ground_content = false,
	_mcl_blast_resistance = 1200,
	_mcl_hardness = 50,
}
if invulnerable then
	add_immortality(slade_brick_def)
end
minetest.register_node("df_underworld_items:slade_brick", slade_brick_def)

local slade_wall_def = {
	description = S("Slade Wall"),
	drawtype = "nodebox",
	node_box = {
		type = "connected",
		fixed = {{-1/4, -1/2, -1/4, 1/4, 1/2, 1/4}},
		-- connect_bottom =
		connect_front = {{-3/16, -1/2, -1/2,  3/16, 3/8, -1/4}},
		connect_left = {{-1/2, -1/2, -3/16, -1/4, 3/8,  3/16}},
		connect_back = {{-3/16, -1/2,  1/4,  3/16, 3/8,  1/2}},
		connect_right = {{ 1/4, -1/2, -3/16,  1/2, 3/8,  3/16}},
	},
	connects_to = { "group:wall", "group:stone", "group:fence" },
	paramtype = "light",
	tiles = {"dfcaverns_slade_brick.png"},
	walkable = true,
	is_ground_content = false,
	groups = { cracky=3, stone=1, level=3, slade=1, pit_plasma_resistant=1, mese_radiation_shield=1},
	sounds = df_underworld_items.sounds.slade,
	_mcl_blast_resistance = 1200,
	_mcl_hardness = 50,
}
if invulnerable then
	add_immortality(slade_wall_def)
end
minetest.register_node("df_underworld_items:slade_wall", slade_wall_def)


minetest.register_node("df_underworld_items:slade_sand", {
	description = S("Slade Sand"),
	_doc_items_longdesc = df_underworld_items.doc.slade_desc,
	_doc_items_usagehelp = df_underworld_items.doc.slade_usage,
	tiles = {"dfcaverns_slade_sand.png"},
	is_ground_content = false,
	groups = {crumbly = 3, level = 2, falling_node = 1, slade=1, pit_plasma_resistant=1, mese_radiation_shield=1},
	sounds = df_underworld_items.sounds.slade_gravel,
	_mcl_blast_resistance = 2000,
	_mcl_hardness = 5,
})

local slade_block_def = {
	description = S("Slade Block"),
	_doc_items_longdesc = df_underworld_items.doc.slade_desc,
	_doc_items_usagehelp = df_underworld_items.doc.slade_usage,
	tiles = {"dfcaverns_slade_block.png"},
	groups = {cracky=3, stone=1, level=3, slade=1, pit_plasma_resistant=1, mese_radiation_shield=1},
	sounds = df_underworld_items.sounds.slade,
	is_ground_content = false,
	_mcl_blast_resistance = 1200,
	_mcl_hardness = 50,
}
if invulnerable then
	add_immortality(slade_block_def)
	slade_block_def.on_blast = function() end
end
minetest.register_node("df_underworld_items:slade_block", slade_block_def)


local slade_seal_def = {
	description = S("Slade Seal"),
	_doc_items_longdesc = df_underworld_items.doc.slade_seal_desc,
	_doc_items_usagehelp = df_underworld_items.doc.slade_usage,
	tiles = {"dfcaverns_slade_block.png^dfcaverns_seal.png", "dfcaverns_slade_block.png"},
	groups = {cracky=3, stone=1, level=3, slade=1, pit_plasma_resistant=1, mese_radiation_shield=1},
	sounds = df_underworld_items.sounds.slade,
	is_ground_content = false,
	_mcl_blast_resistance = 1200,
	_mcl_hardness = 50,
}
if invulnerable then
	slade_seal_def.on_blast = function() end
	add_immortality(slade_seal_def)
end
minetest.register_node("df_underworld_items:slade_seal", slade_seal_def)



minetest.register_abm{
	label = "slade seal scratching",
	nodenames = {"df_underworld_items:slade_seal"},
	interval = 10,
	chance = 20,
	catch_up = false,
	action = function(pos)
		minetest.sound_play({name="dfcaverns_grinding_stone"},
		{
			pos = pos,
			gain = 0.05,
			max_hear_distance = 32,
		}
	)
	end,
}


-- Register stair and slab

df_dependencies.register_stairs("slade_brick")

if invulnerable then
	for name, def in pairs(minetest.registered_nodes) do
		if (name:sub(1,7) == "stairs:" and name:sub(-11) == "slade_block") or 
			name:sub(1,11) == "mcl_stairs:" and name:sub(-11) == "slade_brick" then
				minetest.override_item(name, {can_dig = server_diggable_only})			
		end
	end
end


if minetest.get_modpath("mesecons_mvps") and df_underworld_items.config.invulnerable_slade then
	mesecon.register_mvps_stopper("df_underworld_items:slade")
end