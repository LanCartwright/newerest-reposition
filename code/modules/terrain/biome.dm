/datum/biome
	var/turf_type
	var/list/turfs = list()
	var/center_x
	var/center_y
	var/min_weight = 50
	var/max_weight = 300
	var/weight = 0
	var/list/cells = list()

	var/flora_density = 0
	var/list/flora_types = list()

	var/fauna_density = 0
	var/list/fauna_types = list()

/datum/biome/dirt
	turf_type = /turf/simulated/floor/dirt
	min_weight = 15
	max_weight = 25

/datum/biome/icelake
	turf_type = /turf/unsimulated/beach/water
	min_weight = 10
	max_weight = 20

/datum/biome/lake
	turf_type = /turf/unsimulated/beach/water
	min_weight = 10
	max_weight = 10

/datum/biome/snowy_forest_dense
	turf_type = /turf/simulated/floor/snow
	min_weight = 50
	max_weight = 75
	flora_density = 60
	flora_types = list(/obj/structure/flora/tree/pine = 20 ,/obj/structure/flora/tree/dead = 3, /obj/structure/flora/grass = 2, /obj/structure/flora/grass/brown = 2, /obj/structure/flora/grass/green = 2, /obj/structure/flora/grass/both = 2, /obj/structure/flora/bush = 2)

/datum/biome/snowy_forest
	turf_type = /turf/simulated/floor/snow
	min_weight = 50
	max_weight = 75
	flora_density = 40
	flora_types = list(/obj/structure/flora/tree/pine = 20 ,/obj/structure/flora/tree/dead = 3, /obj/structure/flora/grass = 2, /obj/structure/flora/grass/brown = 2, /obj/structure/flora/grass/green = 2, /obj/structure/flora/grass/both = 2, /obj/structure/flora/bush = 2)

/datum/biome/snowy_plains
	turf_type = /turf/simulated/floor/snow
	min_weight = 50
	max_weight = 75
	flora_density = 5
	flora_types = list(/obj/structure/flora/grass = 2, /obj/structure/flora/grass/brown = 2, /obj/structure/flora/grass/green = 2, /obj/structure/flora/grass/both = 2)

/datum/biome/snowy_plains_dense
	turf_type = /turf/simulated/floor/snow
	min_weight = 50
	max_weight = 75
	flora_density = 50
	flora_types = list(/obj/structure/flora/grass = 2, /obj/structure/flora/grass/brown = 2, /obj/structure/flora/grass/green = 2, /obj/structure/flora/grass/both = 2, /obj/structure/flora/bush = 2)

/datum/biome_cell
	var/center_x
	var/center_y
	var/datum/biome/biome

/datum/biome_cell/New()
	..()
	center_x = rand(1,world.maxx)
	center_y = rand(1,world.maxy)