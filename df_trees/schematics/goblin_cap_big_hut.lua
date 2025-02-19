local n1 = { name = "air", prob = 0 } -- external air
local n2 = { name = "df_trees:goblin_cap" }
local n3 = {name = "stairs:slab_goblin_cap_stem_wood", param2 = 2} -- porch top
local n4 = { name = "df_trees:goblin_cap_gills" }
local n6 = { name = "df_trees:goblin_cap_stem", force_place=true } -- walls
local n7 = { name = "df_trees:goblin_cap_stem_wood", force_place=true } -- internal floor
local n8 = { name = "doors:door_wood_a", force_place=true }
local n9 = { name = "doors:hidden", force_place=true }
local n10 = { name = df_trees.node_names.furnace, param2 = 3, force_place=true }
local n11 = { name = "air", force_place=true } -- internal air
local n12 = { name = "beds:bed_bottom", force_place=true }
local n13 = { name = "df_trees:goblin_cap_stem", prob = 198, force_place=true } -- possible window holes
local n16 = { name = df_trees.node_names.chest, param2 = 3, force_place=true }
local n17 = { name = "beds:bed_top", force_place=true }
local n18 = { name = df_trees.node_names.torch_wall, param2 = 4, force_place=true }
local n19 = { name = "df_trees:goblin_cap_stem" } -- base

local n20 = {name = "stairs:stair_goblin_cap_stem_wood", param2 = 1 }
local n21 = {name = "stairs:stair_goblin_cap_stem_wood", param2 = 3 }
local n22 = {name = "stairs:slab_goblin_cap_stem_wood", param2 = 22}



if minetest.get_modpath("vessels") then
	n18 = { name = "df_trees:glowing_bottle_red", force_place=true}
end

if not minetest.get_modpath("doors") then
	-- replace the door with air
	n8 = n11
	n9 = n11
end
if not minetest.get_modpath("beds") then
	--replace the bed with air
	n12 = n11
	n17 = n11
end
if not minetest.get_modpath("stairs") then
	-- replace stairs with air
	n3 = nil
	n20 = nil
	n21 = nil
	n22 = nil
end

return {
	yslice_prob = {},
	size = {y = 9, x = 11, z = 11},
	center_pos = {x=5, y=2, z=5},
	data = {
		-- z=0, y=0
		n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, 
		-- z=0, y=1
		n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, 
		-- z=0, y=2
		n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, 
		-- z=0, y=3
		n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, 
		-- z=0, y=4
		n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, 
		-- z=0, y=5
		n1, n1, n1, n1, n1, n2, n1, n1, n1, n1, n1, 
		-- z=0, y=6
		n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, 
		-- z=0, y=7
		n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, 
		-- z=0, y=8
		n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, 

		-- z=1, y=0
		n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, 
		-- z=1, y=1
		n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, 
		-- z=1, y=2
		n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, 
		-- z=1, y=3
		n1, n1, n1, n1, n1, n11, n1, n1, n1, n1, n1, 
		-- z=1, y=4
		n1, n1, n1, n1, n1, n11, n1, n1, n1, n1, n1, 
		-- z=1, y=5
		n1, n1, n2, n2, n2, n4, n2, n2, n2, n1, n1, 
		-- z=1, y=6
		n1, n1, n1, n1, n1, n2, n1, n1, n1, n1, n1, 
		-- z=1, y=7
		n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, 
		-- z=1, y=8
		n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, 

		-- z=2, y=0
		n1, n1, n1, n22, n1, n1, n1, n22, n1, n1, n1, 
		-- z=2, y=1
		n1, n1, n1, n1, n20, n1, n21, n1, n1, n1, n1, 
		-- z=2, y=2
		n1, n1, n1, n1, n1, n3, n1, n1, n1, n1, n1, 
		-- z=2, y=3
		n1, n1, n1, n1, n1, n11, n1, n1, n1, n1, n1, 
		-- z=2, y=4
		n1, n1, n1, n1, n1, n11, n1, n1, n1, n1, n1, 
		-- z=2, y=5
		n1, n2, n2, n4, n4, n4, n4, n4, n2, n2, n1, 
		-- z=2, y=6
		n1, n1, n1, n2, n2, n2, n2, n2, n1, n1, n1, 
		-- z=2, y=7
		n1, n1, n1, n1, n1, n2, n1, n1, n1, n1, n1, 
		-- z=2, y=8
		n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, 

		-- z=3, y=0
		n1, n1, n1, n3, n19, n19, n19, n3, n1, n1, n1, 
		-- z=3, y=1
		n1, n1, n1, n1, n19, n19, n19, n1, n1, n1, n1, 
		-- z=3, y=2
		n1, n1, n1, n1, n6, n7, n6, n1, n1, n1, n1, 
		-- z=3, y=3
		n1, n1, n1, n1, n6, n8, n6, n1, n1, n1, n1, 
		-- z=3, y=4
		n1, n1, n1, n1, n6, n9, n6, n1, n1, n1, n1, 
		-- z=3, y=5
		n1, n2, n4, n4, n6, n6, n6, n4, n4, n2, n1, 
		-- z=3, y=6
		n1, n1, n2, n2, n2, n2, n2, n2, n2, n1, n1, 
		-- z=3, y=7
		n1, n1, n1, n2, n2, n2, n2, n2, n1, n1, n1, 
		-- z=3, y=8
		n1, n1, n1, n1, n1, n2, n1, n1, n1, n1, n1, 

		-- z=4, y=0
		n1, n1, n1, n19, n19, n19, n19, n19, n1, n1, n1, 
		-- z=4, y=1
		n1, n1, n1, n19, n19, n19, n19, n19, n1, n1, n1, 
		-- z=4, y=2
		n1, n1, n1, n6, n7, n7, n7, n6, n1, n1, n1, 
		-- z=4, y=3
		n1, n1, n1, n6, n10, n11, n11, n6, n1, n1, n1, 
		-- z=4, y=4
		n1, n1, n1, n6, n11, n11, n11, n6, n1, n1, n1, 
		-- z=4, y=5
		n1, n2, n4, n6, n11, n11, n11, n6, n4, n2, n1, 
		-- z=4, y=6
		n1, n1, n2, n2, n6, n6, n6, n2, n2, n1, n1, 
		-- z=4, y=7
		n1, n1, n1, n2, n2, n2, n2, n2, n1, n1, n1, 
		-- z=4, y=8
		n1, n1, n1, n1, n2, n2, n2, n1, n1, n1, n1, 

		-- z=5, y=0
		n1, n1, n1, n19, n19, n19, n19, n19, n1, n1, n1, 
		-- z=5, y=1
		n1, n1, n1, n19, n19, n19, n19, n19, n1, n1, n1, 
		-- z=5, y=2
		n1, n1, n1, n6, n7, n7, n7, n6, n1, n1, n1, 
		-- z=5, y=3
		n1, n1, n1, n6, n11, n11, n12, n6, n1, n1, n1, 
		-- z=5, y=4
		n1, n1, n1, n13, n11, n11, n11, n13, n1, n1, n1, 
		-- z=5, y=5
		n2, n4, n4, n6, n11, n11, n11, n6, n4, n4, n2, 
		-- z=5, y=6
		n1, n2, n2, n2, n6, n11, n6, n2, n2, n2, n1, 
		-- z=5, y=7
		n1, n1, n2, n2, n2, n6, n2, n2, n2, n1, n1, 
		-- z=5, y=8
		n1, n1, n1, n2, n2, n2, n2, n2, n1, n1, n1, 

		-- z=6, y=0
		n1, n1, n1, n19, n19, n19, n19, n19, n1, n1, n1, 
		-- z=6, y=1
		n1, n1, n1, n19, n19, n19, n19, n19, n1, n1, n1, 
		-- z=6, y=2
		n1, n1, n1, n6, n7, n7, n7, n6, n1, n1, n1, 
		-- z=6, y=3
		n1, n1, n1, n6, n16, n11, n17, n6, n1, n1, n1, 
		-- z=6, y=4
		n1, n1, n1, n6, n18, n11, n11, n6, n1, n1, n1, 
		-- z=6, y=5
		n1, n2, n4, n6, n11, n11, n11, n6, n4, n2, n1, 
		-- z=6, y=6
		n1, n1, n2, n2, n6, n6, n6, n2, n2, n1, n1, 
		-- z=6, y=7
		n1, n1, n1, n2, n2, n2, n2, n2, n1, n1, n1, 
		-- z=6, y=8
		n1, n1, n1, n1, n2, n2, n2, n1, n1, n1, n1, 

		-- z=7, y=0
		n1, n1, n1, n1, n19, n19, n19, n1, n1, n1, n1, 
		-- z=7, y=1
		n1, n1, n1, n1, n19, n19, n19, n1, n1, n1, n1, 
		-- z=7, y=2
		n1, n1, n1, n1, n6, n6, n6, n1, n1, n1, n1, 
		-- z=7, y=3
		n1, n1, n1, n1, n6, n6, n6, n1, n1, n1, n1, 
		-- z=7, y=4
		n1, n1, n1, n1, n6, n13, n6, n1, n1, n1, n1, 
		-- z=7, y=5
		n1, n2, n4, n4, n6, n6, n6, n4, n4, n2, n1, 
		-- z=7, y=6
		n1, n1, n2, n2, n2, n2, n2, n2, n2, n1, n1, 
		-- z=7, y=7
		n1, n1, n1, n2, n2, n2, n2, n2, n1, n1, n1, 
		-- z=7, y=8
		n1, n1, n1, n1, n1, n2, n1, n1, n1, n1, n1, 

		-- z=8, y=0
		n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, 
		-- z=8, y=1
		n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, 
		-- z=8, y=2
		n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, 
		-- z=8, y=3
		n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, 
		-- z=8, y=4
		n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, 
		-- z=8, y=5
		n1, n2, n2, n4, n4, n4, n4, n4, n2, n2, n1, 
		-- z=8, y=6
		n1, n1, n1, n2, n2, n2, n2, n2, n1, n1, n1, 
		-- z=8, y=7
		n1, n1, n1, n1, n1, n2, n1, n1, n1, n1, n1, 
		-- z=8, y=8
		n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, 

		-- z=9, y=0
		n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, 
		-- z=9, y=1
		n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, 
		-- z=9, y=2
		n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, 
		-- z=9, y=3
		n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, 
		-- z=9, y=4
		n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, 
		-- z=9, y=5
		n1, n1, n2, n2, n2, n4, n2, n2, n2, n1, n1, 
		-- z=9, y=6
		n1, n1, n1, n1, n1, n2, n1, n1, n1, n1, n1, 
		-- z=9, y=7
		n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, 
		-- z=9, y=8
		n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, 

		-- z=10, y=0
		n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, 
		-- z=10, y=1
		n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, 
		-- z=10, y=2
		n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, 
		-- z=10, y=3
		n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, 
		-- z=10, y=4
		n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, 
		-- z=10, y=5
		n1, n1, n1, n1, n1, n2, n1, n1, n1, n1, n1, 
		-- z=10, y=6
		n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, 
		-- z=10, y=7
		n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, 
		-- z=10, y=8
		n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, 
}
}
