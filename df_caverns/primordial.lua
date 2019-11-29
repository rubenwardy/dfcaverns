if not df_caverns.config.enable_primordial or not minetest.get_modpath("df_primordial_items") then
	return
end

local perlin_cave_primordial = {
	offset = 0,
	scale = 1,
	spread = {x=df_caverns.config.horizontal_cavern_scale, y=df_caverns.config.vertical_cavern_scale*0.5, z=df_caverns.config.horizontal_cavern_scale},
	seed = 14055553,
	octaves = 3,
	persist = 0.67
}

local perlin_wave_primordial = {
	offset = 0,
	scale = 1,
	spread = {x=df_caverns.config.horizontal_cavern_scale, y=df_caverns.config.vertical_cavern_scale*0.5, z=df_caverns.config.horizontal_cavern_scale},
	seed = 923444,
	octaves = 6,
	persist = 0.63
}

local c_air = minetest.get_content_id("air")

-----------------------------------------------------------------------------------------
-- Fungal biome

local c_orb = minetest.get_content_id("df_primordial_items:glow_orb_hanging")
local c_mycelial_dirt = minetest.get_content_id("df_primordial_items:dirt_with_mycelium")
local c_dirt = minetest.get_content_id("default:dirt")
local c_giant_mycelium = minetest.get_content_id("df_primordial_items:giant_hypha_apical_mapgen")

local fungal_plants = {
	minetest.get_content_id("df_primordial_items:fungal_grass_1"),
	minetest.get_content_id("df_primordial_items:fungal_grass_2"),
	minetest.get_content_id("df_primordial_items:glow_orb"),
	minetest.get_content_id("df_primordial_items:glow_orb_stalks"),
	minetest.get_content_id("df_primordial_items:glow_pods"),
}

local mushroom_cavern_floor = function(abs_cracks, humidity, vi, area, data, data_param2)
	local ystride = area.ystride
	local humidityfactor = humidity/200 + 0.5
	abs_cracks = abs_cracks * humidityfactor

	if abs_cracks < 0.7 then
		data[vi] = c_mycelial_dirt
	elseif abs_cracks < 1 then
		data[vi] = c_dirt
	end

	local rand = math.random() * math.min(abs_cracks, 1) * humidityfactor
	if rand < 0.001 then
		data[vi+ystride] = c_giant_mycelium
	elseif rand < 0.005 then
		local schematic = df_primordial_items.get_primordial_mushroom()
		local rotation = (math.random(1,4)-1)*90
		mapgen_helper.place_schematic_on_data_if_it_fits(data, data_param2, area, area:position(vi+ystride), schematic, rotation)
	elseif rand < 0.05 then
		data[vi+ystride] = fungal_plants[math.random(1,5)]
	end
end

local mushroom_cavern_ceiling = function(abs_cracks, humidity, vi, area, data, data_param2)
	local ystride = area.ystride
	local humidityfactor = humidity/200 + 0.5
	abs_cracks = abs_cracks * humidityfactor

	if abs_cracks < 0.5 then
		data[vi] = c_mycelial_dirt
		if abs_cracks < 0.3 then
			local rand = math.random() * humidityfactor
			if rand < 0.002 then
				data[vi-ystride] = c_giant_mycelium
			elseif rand < 0.03 then
				df_primordial_items.spawn_ceiling_spire_vm(vi, area, data)
			elseif rand < 0.2 then
				data[vi-ystride] = c_orb
				data_param2[vi-ystride] = math.random(0,179)
			end
		end
	end
end

local mushroom_warren_ceiling = function(abs_cracks, vi, area, data, data_param2)
	local ystride = area.ystride

	if abs_cracks < 0.3 then
		data[vi] = c_mycelial_dirt
		if abs_cracks < 0.2 then
			local rand = math.random()
			if rand < 0.002 then
				data[vi-ystride] = c_giant_mycelium
			elseif rand < 0.2 then
				data[vi-ystride] = c_orb
				data_param2[vi-ystride] = math.random(0,179)
			end
		end
	end
end

local mushroom_warren_floor = function(abs_cracks, vi, area, data, data_param2)
	local ystride = area.ystride
	if abs_cracks < 0.7 then
		data[vi] = c_mycelial_dirt
	elseif abs_cracks < 1 then
		data[vi] = c_dirt
	end
	local rand = math.random() * math.min(abs_cracks, 1)
	if rand < 0.001 then
		data[vi+ystride] = c_giant_mycelium
	elseif rand < 0.03 then
		data[vi+ystride] = fungal_plants[math.random(1,5)]
	end
end

--------------------------------------------------------------------------------------------------
-- Jungle biome


local jungle_plants = {
	minetest.get_content_id("df_primordial_items:fern_1"),
	minetest.get_content_id("df_primordial_items:fern_2"),
	minetest.get_content_id("df_primordial_items:glow_plant_1"),
	minetest.get_content_id("df_primordial_items:glow_plant_2"),
	minetest.get_content_id("df_primordial_items:glow_plant_3"),
	minetest.get_content_id("df_primordial_items:jungle_grass_1"),
	minetest.get_content_id("df_primordial_items:jungle_grass_2"),
	minetest.get_content_id("df_primordial_items:jungle_grass_3"),
	minetest.get_content_id("df_primordial_items:jungle_mushroom_1"),
	minetest.get_content_id("df_primordial_items:jungle_mushroom_2"),
}

local c_jungle_dirt = minetest.get_content_id("df_primordial_items:dirt_with_jungle_grass")
local c_plant_matter = minetest.get_content_id("df_primordial_items:plant_matter")
local c_packed_roots = minetest.get_content_id("df_primordial_items:packed_roots")
local c_glowstone = minetest.get_content_id("df_underworld_items:glowstone")
local c_ivy = minetest.get_content_id("df_primordial_items:jungle_ivy")

local jungle_cavern_floor = function(abs_cracks, humidity, vi, area, data, data_param2)
	local ystride = area.ystride
	local humidityfactor = humidity/100
	
	data[vi] = c_jungle_dirt

	local rand = math.random()
	if rand < 0.025 * humidityfactor then
		local fern_schematic = df_primordial_items.get_fern_schematic()
		local rotation = (math.random(1,4)-1)*90
		mapgen_helper.place_schematic_on_data_if_it_fits(data, data_param2, area, area:position(vi+ystride), fern_schematic, rotation)
	elseif rand < 0.05 * (1-humidityfactor) then
		df_primordial_items.spawn_jungle_mushroom_vm(vi+ystride, area, data)
	elseif rand < 0.1 * (1-humidityfactor) then
		df_primordial_items.spawn_jungle_tree_vm(math.random(8,14), vi+ystride, area, data)
	elseif rand < 0.3 then
		data[vi+ystride] = jungle_plants[math.random(1,#jungle_plants)]
	end
end

local jungle_cavern_ceiling = function(abs_cracks, vi, area, data, data_param2)
	if abs_cracks < 0.25 then
		data[vi] = c_glowstone
	elseif abs_cracks > 0.75 and math.random() < 0.1 then
		local ystride = area.ystride
		local index = vi - ystride
		for i = 1, math.random(16) do
			if data[index] == c_air then
				data[index] = c_ivy
				index = index - ystride
			else
				break
			end
		end
	end
end

local jungle_warren_ceiling = function(abs_cracks, vi, area, data, data_param2)
	if abs_cracks < 0.1 then
		data[vi] = c_glowstone
	end
end

local jungle_warren_floor = function(abs_cracks, vi, area, data, data_param2)
	local ystride = area.ystride
	if abs_cracks < 0.7 then
		data[vi] = c_jungle_dirt
		local rand = math.random() * abs_cracks
		if rand < 0.1 then
			data[vi+ystride] = jungle_plants[math.random(1,#jungle_plants)]
		end
	elseif abs_cracks < 1 then
		data[vi] = c_dirt
	end
end
---------------------------------------------------------------------------------------------------------

local decorate_primordial = function(minp, maxp, seed, vm, node_arrays, area, data)
	math.randomseed(minp.x + minp.y*2^8 + minp.z*2^16 + seed) -- make decorations consistent between runs

	local data_param2 = df_caverns.data_param2
	vm:get_param2_data(data_param2)
	local nvals_cracks = mapgen_helper.perlin2d("df_cavern:cracks", minp, maxp, df_caverns.np_cracks)
	local cave_area = node_arrays.cave_area
	local nvals_cave = node_arrays.nvals_cave
	
	local humiditymap = minetest.get_mapgen_object("humiditymap")

	
	---------------------------------------------------------
	-- Cavern floors
	
	for _, vi in ipairs(node_arrays.cavern_floor_nodes) do
		local index2d = mapgen_helper.index2di(minp, maxp, area, vi)
		local cracks = nvals_cracks[index2d]
		local abs_cracks = math.abs(cracks)
		local humidity = humiditymap[index2d]
		local jungle = nvals_cave[vi] < 0
		
		if jungle then
			jungle_cavern_floor(abs_cracks, humidity, vi, area, data, data_param2)
		else
			mushroom_cavern_floor(abs_cracks, humidity, vi, area, data, data_param2)
		end
	end
	
	--------------------------------------
	-- Cavern ceilings

	for _, vi in ipairs(node_arrays.cavern_ceiling_nodes) do
		local index2d = mapgen_helper.index2di(minp, maxp, area, vi)
		local cracks = nvals_cracks[index2d]
		local abs_cracks = math.abs(cracks)
		local jungle = nvals_cave[vi] < 0
		local humidity = humiditymap[index2d]
		if jungle then
			jungle_cavern_ceiling(abs_cracks, vi, area, data, data_param2)
		else
			mushroom_cavern_ceiling(abs_cracks, humidity, vi, area, data, data_param2)
		end


	end
	
		----------------------------------------------
	-- Tunnel floors
	
	for _, vi in ipairs(node_arrays.tunnel_floor_nodes) do
	end
	
	------------------------------------------------------
	-- Tunnel ceiling
	
	for _, vi in ipairs(node_arrays.tunnel_ceiling_nodes) do
	end
	
	------------------------------------------------------
	-- Warren ceiling

	for _, vi in ipairs(node_arrays.warren_ceiling_nodes) do
		local index2d = mapgen_helper.index2di(minp, maxp, area, vi)
		local cracks = nvals_cracks[index2d]
		local abs_cracks = math.abs(cracks)
		local jungle = nvals_cave[vi] < 0
		
		if jungle then
			jungle_warren_ceiling(abs_cracks, vi, area, data, data_param2)
		else
			mushroom_warren_ceiling(abs_cracks, vi, area, data, data_param2)
		end

	end

	----------------------------------------------
	-- Warren floors
	
	for _, vi in ipairs(node_arrays.warren_floor_nodes) do
		local index2d = mapgen_helper.index2di(minp, maxp, area, vi)
		local cracks = nvals_cracks[index2d]
		local abs_cracks = math.abs(cracks)
		local jungle = nvals_cave[vi] < 0
		
		if jungle then
			jungle_warren_floor(abs_cracks, vi, area, data, data_param2)
		else
			mushroom_warren_floor(abs_cracks, vi, area, data, data_param2)
		end
	end

	-- columns
	-- no flowstone below the Sunless Sea, replace with something else
	for _, vi in ipairs(node_arrays.column_nodes) do
		local jungle = nvals_cave[vi] < 0
		if jungle then
			data[vi] = c_plant_matter
		else
			data[vi] = c_mycelial_dirt
		end
	end

	vm:set_param2_data(data_param2)
end

--Primordial Caverns
subterrane.register_layer({
	name = "primordial",
	y_max = df_caverns.config.primordial_max,
	y_min = df_caverns.config.primordial_min,
	cave_threshold = df_caverns.config.sunless_sea_threshold, -- Make the caves a bit bigger than above
	perlin_cave = perlin_cave_primordial,
	perlin_wave = perlin_wave_primordial,
	solidify_lava = true,
--	columns = {
--		maximum_radius = 20,
--		minimum_radius = 5,
--		node = "df_mapitems:wet_flowstone", -- no flowstone below the Sunless Sea, replace with something else
--		weight = 0.5,
--		maximum_count = 60,
--		minimum_count = 10,
--	},
	decorate = decorate_primordial,
	double_frequency = true,
	is_ground_content = df_caverns.is_ground_content,
})
