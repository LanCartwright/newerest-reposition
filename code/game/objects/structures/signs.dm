/obj/structure/sign
	icon = 'icons/obj/decals.dmi'
	anchored = 1
	opacity = 0
	density = 0
	layer = 3.5
	w_class = 3

/obj/structure/sign/ex_act(severity)
	switch(severity)
		if(1.0)
			qdel(src)
			return
		if(2.0)
			qdel(src)
			return
		if(3.0)
			qdel(src)
			return
		else
	return

/obj/structure/sign/attackby(obj/item/tool as obj, mob/user as mob)	//deconstruction
	if(isscrewdriver(tool) && !istype(src, /obj/structure/sign/double))
		user << "You unfasten the sign with your [tool]."
		unfasten()
	else ..()

/obj/structure/sign/proc/unfasten()
	var/obj/item/sign/S = new(src.loc)
	S.name = name
	S.desc = desc
	S.icon_state = icon_state
	//var/icon/I = icon('icons/obj/decals.dmi', icon_state)
	//S.icon = I.Scale(24, 24)
	S.sign_state = icon_state
	qdel(src)

/obj/item/sign
	name = "sign"
	desc = ""
	icon = 'icons/obj/decals.dmi'
	w_class = 5		//big
	var/sign_state = ""

/obj/item/sign/attackby(obj/item/tool as obj, mob/user as mob)	//construction
	if(isscrewdriver(tool) && isturf(user.loc))
		var/direction = input("In which direction?", "Select direction.") in list("North", "East", "South", "West", "Cancel")
		if(direction == "Cancel") return
		var/obj/structure/sign/S = new(user.loc)
		switch(direction)
			if("North")
				S.pixel_y = 32
			if("East")
				S.pixel_x = 32
			if("South")
				S.pixel_y = -32
			if("West")
				S.pixel_x = -32
			else return
		S.name = name
		S.desc = desc
		S.icon_state = sign_state
		user << "You fasten \the [S] with your [tool]."
		qdel(src)
	else ..()

/obj/structure/sign/double/map
	name = "station map"
	desc = "A framed picture of the station."

/obj/structure/sign/double/map/left
	icon_state = "map-left"

/obj/structure/sign/double/map/right
	icon_state = "map-right"

/obj/structure/sign/securearea
	name = "\improper SECURE AREA"
	desc = "A warning sign which reads 'SECURE AREA'."
	icon_state = "securearea"

/obj/structure/sign/biohazard
	name = "\improper BIOHAZARD"
	desc = "A warning sign which reads 'BIOHAZARD'."
	icon_state = "bio"

/obj/structure/sign/electricshock
	name = "\improper HIGH VOLTAGE"
	desc = "A warning sign which reads 'HIGH VOLTAGE'."
	icon_state = "shock"

/obj/structure/sign/examroom
	name = "\improper EXAM"
	desc = "A guidance sign which reads 'EXAM ROOM'."
	icon_state = "examroom"

/obj/structure/sign/vacuum
	name = "\improper HARD VACUUM AHEAD"
	desc = "A warning sign which reads 'HARD VACUUM AHEAD'."
	icon_state = "space"

/obj/structure/sign/drop
	name = "\improper DANGER! DROP HAZARD"
	desc = "A warning sign which reads 'DANGER! DROP HAZARD'."
	icon_state = "drop"

/obj/structure/sign/deathsposal
	name = "\improper DISPOSAL LEADS TO SPACE"
	desc = "A warning sign which reads 'DISPOSAL LEADS TO SPACE'."
	icon_state = "deathsposal"

/obj/structure/sign/pods
	name = "\improper ESCAPE PODS"
	desc = "A warning sign which reads 'ESCAPE PODS'."
	icon_state = "pods"

/obj/structure/sign/fire
	name = "\improper DANGER: FIRE"
	desc = "A warning sign which reads 'DANGER: FIRE'."
	icon_state = "fire"

/obj/structure/sign/nosmoking_1
	name = "\improper NO SMOKING"
	desc = "A warning sign which reads 'NO SMOKING'."
	icon_state = "nosmoking"

/obj/structure/sign/nosmoking_2
	name = "\improper NO SMOKING"
	desc = "A warning sign which reads 'NO SMOKING'."
	icon_state = "nosmoking2"

/obj/structure/sign/greencross
	name = "medbay"
	desc = "The Intergalactic symbol of Medical institutions. You'll probably get help here."
	icon_state = "greencross"

/obj/structure/sign/goldenplaque
	name = "The Most Robust Men Award for Robustness"
	desc = "To be Robust is not an action or a way of life, but a mental state. Only those with the force of Will strong enough to act during a crisis, saving friend from foe, are truly Robust. Stay Robust my friends."
	icon_state = "goldenplaque"

/obj/structure/sign/kiddieplaque
	name = "\improper AI developers plaque"
	desc = "Next to the extremely long list of names and job titles, there is a drawing of a little child. The child appears to be retarded. Beneath the image, someone has scratched the word \"PACKETS\""
	icon_state = "kiddieplaque"

/obj/structure/sign/atmosplaque
	name = "\improper FEA atmospherics division plaque"
	desc = "This plaque commemorates the fall of the Atmos FEA division. For all the charred, dizzy, and brittle men who have died in its hands."
	icon_state = "atmosplaque"

/obj/structure/sign/double/maltesefalcon	//The sign is 64x32, so it needs two tiles. ;3
	name = "The Maltese Falcon"
	desc = "The Maltese Falcon, Space Bar and Grill."

/obj/structure/sign/double/maltesefalcon/left
	icon_state = "maltesefalcon-left"

/obj/structure/sign/double/maltesefalcon/right
	icon_state = "maltesefalcon-right"

/obj/structure/sign/science			//These 3 have multiple types, just var-edit the icon_state to whatever one you want on the map
	name = "\improper SCIENCE!"
	desc = "A warning sign which reads 'SCIENCE!'."
	icon_state = "science1"

/obj/structure/sign/chemistry
	name = "\improper CHEMISTRY"
	desc = "A warning sign which reads 'CHEMISTRY'."
	icon_state = "chemistry1"

/obj/structure/sign/botany
	name = "\improper HYDROPONICS"
	desc = "A warning sign which reads 'HYDROPONICS'."
	icon_state = "hydro1"

/obj/structure/sign/directions
	name = "direction sign"
	desc = "A direction sign, claiming to know the way."
	icon_state = "direction"

/obj/structure/sign/directions/science
	name = "\improper Science department"
	desc = "A direction sign, pointing out which way the Science department is."
	icon_state = "direction_sci"

/obj/structure/sign/directions/engineering
	name = "\improper Engineering department"
	desc = "A direction sign, pointing out which way the Engineering department is."
	icon_state = "direction_eng"

/obj/structure/sign/directions/security
	name = "\improper Security department"
	desc = "A direction sign, pointing out which way the Security department is."
	icon_state = "direction_sec"

/obj/structure/sign/directions/medical
	name = "\improper Medical Bay"
	desc = "A direction sign, pointing out which way the Medical Bay is."
	icon_state = "direction_med"

/obj/structure/sign/directions/evac
	name = "\improper Escape Dock"
	desc = "A direction sign, pointing out which way the escape shuttle dock is."
	icon_state = "direction_evac"

/obj/structure/sign/directions/cryo
	name = "\improper Cryogenics Storage"
	desc = "A direction sign, pointing out which way the station's Cryogenics Storage station is."
	icon_state = "direction_cryo"

/obj/structure/sign/directions/dock
	name = "\improper Departures/Arrivals Dock"
	desc = "A direction sign. It reads: 'Reminder: All personnel are required to make use of the Auto-locker device before heading to the Docking area. Thank you.'"
	icon_state = "direction_dock"

/obj/structure/sign/directions/civ
	name = "\improper Civilian department"
	desc = "A direction sign, pointing out which way the Civilian sector is."
	icon_state = "direction_civ"

/obj/structure/sign/directions/com
	name = "\improper Command department"
	desc = "A direction sign, pointing out which way the Command sector is."
	icon_state = "direction_com"

/obj/structure/sign/directions/all
	name = "\improper All directions"
	desc = "A multi-coloured direction sign, pointing out in which all main departments are located."
	icon_state = "direction_all"


/obj/structure/sign/christmas/lights
	name = "Christmas lights"
	desc = "Flashy."
	icon = 'icons/obj/christmas.dmi'
	icon_state = "xmaslights"
	layer = 4.9

/obj/structure/sign/christmas/wreath
	name = "wreath"
	desc = "Prickly and overrated."
	icon = 'icons/obj/christmas.dmi'
	icon_state = "doorwreath"
	layer = 5

/obj/structure/sign/flag/blank
	name = "blank banner"
	desc = "A blank blue flag"
	icon_state = "flag"

/obj/structure/sign/flag/blank/left
	icon_state = "flag_l"

/obj/structure/sign/flag/blank/right
	icon_state = "flag_r"

/obj/structure/sign/flag/sol
	name = "Sol Alliance Flag"
	desc = "The bright blue flag of the Alliance of Sovereign Solarian Nations."
	icon_state = "solgov"

/obj/structure/sign/flag/sol/left
	icon_state = "solgov_l"

/obj/structure/sign/flag/sol/right
	icon_state = "solgov_r"

/obj/item/weapon/flag/sol
	name = "Sol Alliance Flag"
	desc = "The bright blue flag of the Alliance of Sovereign Solarian Nations."
	flag_path = "solgov"

/obj/item/weapon/flag/sol/l
	flag_size = 1

/obj/structure/sign/flag/dominia
	name = "Dominian Empire Flag"
	desc = "The Imperial Standard of Emperor Boleslaw Keeser of Dominia"
	icon_state = "dominia"

/obj/structure/sign/flag/dominia/left
	icon_state = "dominia_l"

/obj/structure/sign/flag/dominia/right
	icon_state = "dominia_r"

/obj/item/weapon/flag/dominia
	name = "Dominian Empire Flag"
	desc = "The Imperial Standard of Emperor Boleslaw Keeser of Dominia"
	flag_path = "dominia"

/obj/item/weapon/flag/dominia/l
	flag_size = 1

/obj/structure/sign/flag/elyra
	name = "Elyran Flag"
	desc = "The hopeful colors of the Serene Republic of Elyra."
	icon_state = "elyra"

/obj/structure/sign/flag/elyra/left
	icon_state = "elyra_l"

/obj/structure/sign/flag/elyra/right
	icon_state = "elyra_r"

/obj/item/weapon/flag/elyra
	name = "Elyran Flag"
	desc = "The hopeful colors of the Serene Republic of Elyra."
	flag_path = "elyra"

/obj/item/weapon/flag/elyra/l
	flag_size = 1

/obj/structure/sign/flag/hegemony
	name = "Hegemony Flag"
	desc = "The feudal standard of the Izweski Hegemony."
	icon_state = "izweski"

/obj/structure/sign/flag/hegemony/left
	icon_state = "izweski_l"

/obj/structure/sign/flag/hegemony/right
	icon_state = "izweski_r"

/obj/item/weapon/flag/hegemony
	name = "Hegemony Flag"
	desc = "The feudal standard of the Izweski Hegemony."
	flag_path = "izweski"

/obj/item/weapon/flag/hegemony/l
	flag_size = 1

/obj/structure/sign/flag/jargon
	name = "Jargon Federation Flag"
	desc = "The insignia of the Jargon Federation"
	icon_state = "jargon"

/obj/structure/sign/flag/jargon/left
	icon_state = "jargon_l"

/obj/structure/sign/flag/jargon/right
	icon_state = "jargon_r"

/obj/item/weapon/flag/jargon
	name = "Jargon Federation Flag"
	desc = "The insignia of the Jargon Federation"
	flag_path = "jargon"

/obj/item/weapon/flag/jargon/l
	flag_size = 1

/obj/structure/sign/flag/nanotrasen
	name = "NanoTrasen Corporation Flag"
	desc = "The logo of NanoTrasen on a flag."
	icon_state = "nanotrasen"

/obj/structure/sign/flag/nanotrasen/left
	icon_state = "nanotrasen_l"

/obj/structure/sign/flag/nanotrasen/right
	icon_state = "nanotrasen_r"

/obj/item/weapon/flag/nanotrasen
	name = "NanoTrasen Corporation Flag"
	desc = "The logo of NanoTrasen on a flag"
	flag_path = "nanotrasen"

/obj/item/weapon/flag/nanotrasen/l
	flag_size = 1

/obj/item/weapon/flag
	name = "boxed flag"
	desc = "A flag neatly folded into a wooden container."
	icon = 'icons/obj/decals.dmi'
	icon_state = "flag_boxed"
	var/flag_path
	var/flag_size = 0

/obj/item/weapon/flag/afterattack(var/atom/A, var/mob/user, var/adjacent, var/clickparams)
	if (!adjacent)
		return

	var/turf/W = A
	if (!iswall(W) || !isturf(user.loc))
		user << "<span class='warning'>You can't place this here!</span>"
		return

	var/placement_dir = get_dir(user, W)
	if (!(placement_dir in cardinal))
		user << "<span class='warning'>You must stand directly in front of the wall you wish to place that on.</span>"
		return

	var/obj/structure/sign/flag/P = new(user.loc)

	switch(placement_dir)
		if(NORTH)
			P.pixel_y = 32
		if(SOUTH)
			P.pixel_y = -32
		if(EAST)
			P.pixel_x = 32
		if(WEST)
			P.pixel_x = -32

	P.dir = placement_dir
	if(flag_size)
		P.icon_state = "[flag_path]_l"
		var/obj/structure/sign/flag/P2 = new(user.loc)
		P2.icon_state = "[flag_path]_r"
		P2.dir = P.dir
		switch(P2.dir)
			if(NORTH)
				P2.pixel_y = P.pixel_y
				P2.pixel_x = 32
			if(SOUTH)
				P2.pixel_y = P.pixel_y
				P2.pixel_x = 32
			if(EAST)
				P2.pixel_x = P.pixel_x
				P2.pixel_y = -32
			if(WEST)
				P2.pixel_x = P.pixel_x
				P2.pixel_y = 32
		P2.name = name
		P2.desc = desc
	else
		P.icon_state = "[flag_path]"
	P.name = name
	P.desc = desc
	qdel(src)




