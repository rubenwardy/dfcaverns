local S = df_underworld_items.S

local glowstone_def = {
	_doc_items_longdesc = df_underworld_items.doc.glowstone_desc,
	_doc_items_usagehelp = df_underworld_items.doc.glowstone_usage,
	light_source = minetest.LIGHT_MAX,
	description = S("Lightseam"),
	tiles = {
		{
			name = "dfcaverns_glowstone_anim.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 8,
			},
		},
	},
	is_ground_content = false,
	groups = {cracky=3},
	sounds = df_underworld_items.sounds.glass(),
	paramtype = "light",
	drawtype = "glasslike",
	drop = "",
	sunlight_propagates = true,
	_mcl_blast_resistance = 0.5,
	_mcl_hardness = 0.5,
}
if minetest.get_modpath("tnt") then
	glowstone_def.on_dig = function(pos, node, digger)
		tnt.boom(pos, {radius=3})
	end
end
minetest.register_node("df_underworld_items:glowstone", glowstone_def)