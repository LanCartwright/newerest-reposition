/obj/effect/landmark/terrain_generator
	name = "terrain generator"
	icon_state = "girder"
	var/list/biomes = list()
	var/list/cells = list()
	var/has_gravity = 1
	var/ruins = 1
	var/list/possible_biomes = list(/datum/biome/dirt = 2, /datum/biome/icelake = 3, /datum/biome/lake = 3, /datum/biome/snowy_plains = 5, /datum/biome/snowy_plains = 5 , /datum/biome/snowy_forest = 5, /datum/biome/snowy_forest_dense = 5)

/obj/effect/landmark/terrain_generator/New()
	terrain_generators += src

/obj/effect/landmark/terrain_generator/proc/generate()
	pick_biomes()
	generate_cells()

/obj/effect/landmark/terrain_generator/proc/pick_biomes()
	for(var/I in 10 to 100)
		cells += new /datum/biome_cell
	var/list/unused_cells = cells.Copy()

	for(var/i in 1 to rand(6,20))
		var/biometype = pickweight(possible_biomes)
		var/datum/biome/B = new biometype
		B.center_x = rand(1,world.maxx)
		B.center_y = rand(1,world.maxy)
		B.weight = rand(B.min_weight, B.max_weight)
		var/datum/biome_cell/cell = pick_n_take(unused_cells)
		B.cells += cell
		cell.biome = B
		biomes[B] = B.weight

	while(unused_cells.len)
		var/datum/biome/B = pickweight(biomes)
		var/datum/biome_cell/closest_cell
		var/closest_dist = 9876543210
		for(var/datum/biome_cell/C1 in B.cells)
			for(var/datum/biome_cell/C2 in unused_cells)
				var/dx = C2.center_x - C1.center_x
				var/dy = C2.center_y - C1.center_y
				var/dist = (dx*dx) + (dy*dy)
				if(dist < closest_dist)
					closest_cell = C2
					closest_dist = dist
		if(!closest_cell)
			break // SHITS FUCKED
		unused_cells -= closest_cell
		B.cells += closest_cell
		closest_cell.biome = B

/obj/effect/landmark/terrain_generator/proc/generate_cells() // Generate voronoi cells using manhattan distance
	for(var/datum/sub_turf_block/STB in split_block(locate(1, 1, src.z), locate(world.maxx, world.maxy, src.z)))
		for(var/turf/T in STB.return_list())
			if(!istype(T, /turf/genturf))
				continue // no
			var/datum/biome_cell/closest
			var/closest_dist = 99999
			for(var/datum/biome_cell/B in cells)
				var/dx = B.center_x-T.x
				var/dy = B.center_y-T.y
				var/dist = (dx*dx)+(dy*dy)
				if(dist < closest_dist)
					closest = B
					closest_dist = dist
			if(closest)
				var/datum/biome/B = closest.biome
				T.ChangeTurf(B.turf_type, FALSE, FALSE, TRUE)
				B.turfs += T
				if(istype(T,/turf/simulated))
					if(B.flora_density && B.flora_types)
						generate_flora(B, T)
					if(B.fauna_density && B.fauna_types)
						generate_fauna(B, T)

/obj/effect/landmark/terrain_generator/proc/generate_flora(var/datum/biome/B, var/turf/T)
	if(prob(B.flora_density))
		var/obj/structure/flora = pick(B.flora_types)
		new flora(T)

/obj/effect/landmark/terrain_generator/proc/generate_fauna(var/datum/biome/B, var/turf/T)
	if(prob(B.fauna_density))
		var/mob/fauna = pick(B.fauna_types)
		new fauna(T)

/turf/genturf
	name = "ungenerated turf"
	desc = "If you see this, and you're not a ghost, yell at coders"
	icon = 'icons/turf/winterstorm.dmi'
	icon_state = "genturf"

/turf/simulated/floor/dirt
	name = "dirt"
	icon = 'icons/turf/winterstorm.dmi'
	icon_state = "dirt"

/turf/simulated/floor/plating/snow
	name = "snow"
	desc = "Looks cold."
	icon = 'icons/turf/snow.dmi'
	icon_state = "snow"
