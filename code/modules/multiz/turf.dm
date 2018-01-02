/turf/simulated/open/attack_hand(mob/living/user as mob)
	if(!istype(below)) //make sure that there is actually something below
		below = GetBelow(src)
		if(!below)
			return
	user << "<span class='notice'>You start climbing down to the area below</span>"
	below.visible_message("You notice \The [user] climbing down from above")
	if(do_after(user, 50, src)) //How long it takes the player to climb down.
		if(istype(below, /turf/simulated/open))
			user << "<span class='notice'>You fail to climb down to the area below</span>"
		else
			user << "<span class='notice'>You succesfuly climb to the area below</span>"
		user.forceMove(below)