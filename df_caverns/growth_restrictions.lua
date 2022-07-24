local black_cap_old = df_trees.black_cap_growth_permitted
local black_cap_new = function(pos)
	return df_caverns.get_biome(pos) == "blackcap"
end
df_trees.black_cap_growth_permitted = function(pos)
	return black_cap_old(pos) and black_cap_new(pos)
end

local blood_thorn_old = df_trees.blood_thorn_growth_permitted
local blood_thorn_new = function(pos)
	return df_caverns.get_biome(pos) == "bloodthorn"
end
df_trees.blood_thorn_growth_permitted = function(pos)
	return blood_thorn_old(pos) and blood_thorn_new(pos)
end

local fungiwood_old = df_trees.fungiwood_growth_permitted
local fungiwood_new = function(pos)
	local biome = df_caverns.get_biome(pos)
	return biome == "fungiwood" or biome == "fungispore"
end
df_trees.fungiwood_growth_permitted = function(pos)
	return fungiwood_old(pos) and fungiwood_new(pos)
end

local goblin_cap_old = df_trees.goblin_cap_growth_permitted
local goblin_cap_new = function(pos)
	local biome = df_caverns.get_biome(pos)
	return biome == "goblincap" or biome == "towergoblin"
end
df_trees.goblin_cap_growth_permitted = function(pos)
	return goblin_cap_old(pos) and goblin_cap_new(pos)
end

local nether_cap_old = df_trees.nether_cap_growth_permitted
local nether_cap_new = function(pos)
	return df_caverns.get_biome(pos) == "nethercap"
end
df_trees.nether_cap_growth_permitted = function(pos)
	return nether_cap_old(pos) and nether_cap_new(pos)
end

-- Deliberately not biome-restricted
--local spindlestem_old = df_trees.spindlestem_growth_permitted
--local spindlestem_new = function(pos)
--end
--df_trees.spindlestem_growth_permitted = function(pos)
--	return spindlestem_old(pos) and spindlestem_new(pos)
--end

local spore_tree_old = df_trees.spore_tree_growth_permitted
local spore_tree_new = function(pos)
	local biome = df_caverns.get_biome(pos)
	return biome == "sporetree" or biome == "fungispore"
end
df_trees.spore_tree_growth_permitted = function(pos)
	return spore_tree_old(pos) and spore_tree_new(pos)
end

-- Deliberately not biome-restricted
--local torchspine_old = df_trees.torchspine_growth_permitted
--local torchspine_new = function(pos)
--end
--df_trees.torchspine_growth_permitted = function(pos)
--	return torchspine_old(pos) and torchspine_new(pos)
--end

local tower_cap_old = df_trees.tower_cap_growth_permitted
local tower_cap_new = function(pos)
	local biome = df_caverns.get_biome(pos)
	return biome == "towercap" or biome == "towergoblin"
end
df_trees.tower_cap_growth_permitted = function(pos)
	return tower_cap_old(pos) and tower_cap_new(pos)
end

local tunnel_tube_old = df_trees.tunnel_tube_growth_permitted
local tunnel_tube_new = function(pos)
	return df_caverns.get_biome(pos) == "tunneltube"	
end
df_trees.tunnel_tube_growth_permitted = function(pos)
	return tunnel_tube_old(pos) and tunnel_tube_new(pos)
end

------------------------------------------------

local giant_fern_old = df_primordial_items.giant_fern_growth_permitted
local giant_fern_new = function(pos)
	return df_caverns.get_biome(pos) == "primordial jungle"
end
df_primordial_items.giant_fern_growth_permitted = function(pos)
	return giant_fern_old(pos) and giant_fern_new(pos)
end

local giant_mycelium_old = df_primordial_items.giant_mycelium_growth_permitted
local giant_mycelium_new = function(pos)
	return df_caverns.get_biome(pos) == "primordial fungus"
end
df_primordial_items.giant_mycelium_growth_permitted = function(pos)
	return giant_mycelium_old(pos) and giant_mycelium_new(pos)
end

local jungle_mushroom_old = df_primordial_items.jungle_mushroom_growth_permitted
local jungle_mushroom_new = function(pos)
	return df_caverns.get_biome(pos) == "primordial jungle"
end
df_primordial_items.jungle_mushroom_growth_permitted = function(pos)
	return jungle_mushroom_old(pos) and jungle_mushroom_new(pos)
end

local jungletree_old = df_primordial_items.jungletree_growth_permitted
local jungletree_new = function(pos)
	return df_caverns.get_biome(pos) == "primordial jungle"
end
df_primordial_items.jungletree_growth_permitted = function(pos)
	return jungletree_old(pos) and jungletree_new(pos)
end

local primordial_mushroom_old = df_primordial_items.primordial_mushroom_growth_permitted
local primordial_mushroom_new = function(pos)
	return df_caverns.get_biome(pos) == "primordial fungus"
end
df_primordial_items.primordial_mushroom_growth_permitted = function(pos)
	return primordial_mushroom_old(pos) and primordial_mushroom_new(pos)
end

--------------------------------------------------

--local cave_wheat_old = df_farming.growth_permitted["df_farming:cave_wheat_seed"]
--local cave_wheat_new = function(pos)
--end
--df_farming.growth_permitted["df_farming:cave_wheat_seed"] = function(pos)
--	return cave_wheat_old(pos) and cave_wheat_new(pos)
--end
--
--local dimple_cup_old = df_farming.growth_permitted["df_farming:dimple_cup_seed"]
--local dimple_cup_new = function(pos)
--end
--df_farming.growth_permitted["df_farming:dimple_cup_seed"] = function(pos)
--	return dimple_cup_old(pos) and dimple_cup_new(pos)
--end
--
--local pig_tail_old = df_farming.growth_permitted["df_farming:pig_tail_seed"]
--local pig_tail_new = function(pos)
--end
--df_farming.growth_permitted["df_farming:pig_tail_seed"] = function(pos)
--	return pig_tail_old(pos) and pig_tail_new(pos)
--end
--
--local quarry_bush_old = df_farming.growth_permitted["df_farming:quarry_bush_seed"]
--local quarry_bush_new = function(pos)
--end
--df_farming.growth_permitted["df_farming:quarry_bush_seed"] = function(pos)
--	return quarry_bush_old(pos) and quarry_bush_new(pos)
--end
--
--local sweet_pod_old = df_farming.growth_permitted["df_farming:sweet_pod_seed"]
--local sweet_pod_new = function(pos)
--end
--df_farming.growth_permitted["df_farming:sweet_pod_seed"] = function(pos)
--	return sweet_pod_old(pos) and sweet_pod_new(pos)
--end
--
--local plump_helmet_old = df_farming.growth_permitted["df_farming:plump_helmet_spawn"]
--local plump_helmet_new = function(pos)
--end
--df_farming.growth_permitted["df_farming:plump_helmet_spawn"] = function(pos)
--	return plump_helmet_old(pos) and plump_helmet_new(pos)
--end