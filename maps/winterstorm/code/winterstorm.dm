/datum/map/winterstorm
	name = "Winterstorm"
	full_name = "Nanotrasen Rescue Mission: Operation Winterstorm"
	path = "winterstorm"

	station_levels = list(2,3,4,5,6,7,8,9,10,11,12,13,14)
	admin_levels = list(1)
	contact_levels = list(2,3,4)
	player_levels = list(2,3,4,5,6,7,8,9,10,11,12,13,14)
	accessible_z_levels = list()

	station_name = "Crash site"
	station_short = "winterstorm"
	dock_name = "Landing Zone"
	boss_name = "Nanotrasen Rescue Force"
	boss_short = "NT-RF"
	company_name = "Nanotrasen"
	company_short = "NT"
	system_name = "Omega Lambda 7 XL9"

	// CT/Emergency shuttle messages; technically optional, but you probably want to define them.
	shuttle_docked_message = "BLACKBOX ALERT: Distress beacon detects landed rescue craft. Please board rescue craft and follow all rescue instructions."    // The message shown when the CT shuttle docks with the station. Available blanks: %dock% (replaced with dock_name), %ETA% (replaced with time until launch).
	shuttle_leaving_dock = "BLACKBOX SHUTDOWN INITIATED: Rescue craft detected leaving. Goodbye crew."    // The message shown when the CT shuttle leaves the station. Available blanks: %dock%, %ETA%.
	shuttle_called_message = "Shuttle terminating Blackbox connection. Initiate Blackbox shutdown sequence."    // The message shown when the CT shuttle departs the dock for the station. Available blanks: %dock%, %ETA%.
	shuttle_recall_message = "Blackbox emergancy signal lost. Rescue sequence cancelled."    // The message shown when the CT shuttle is recalled. No blanks.
	emergency_shuttle_docked_message = "Rescue craft landing successful. Please board and follow all instructions."   // The message shown when the emergency shuttle docks. Available blanks: %ETD% (replaced with time until launch)
	emergency_shuttle_leaving_dock = "Rescue craft departing landing zone. Please follow all instructions."    // The message shown when the emergency shuttle leaves the station. Available blanks: %ETA% (replaced with time until arrival), %dock% (replaced with dock_name).
	emergency_shuttle_recall_message = "Rescue sequence cancelled."    // The message shown when the emergency shuttle is recalled. No blanks.
	emergency_shuttle_called_message = "Black box signal detected. Rescue sequence commencing."    // The message shown when the emergency shuttle is called. Available blanks: %ETA%

/datum/map/winterstorm/finalize_load()
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