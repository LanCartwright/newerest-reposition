var/global/list/datum/stack_recipe/rod_recipes = list(
	new /datum/stack_recipe("grille", /obj/structure/grille, 2, time = 10, one_per_turf = TRUE, on_floor = TRUE),
	new /datum/stack_recipe("floor-mounted catwalk", /obj/structure/lattice/catwalk/indoor, 4, time = 10, one_per_turf = TRUE, on_floor = TRUE),
	new /datum/stack_recipe("mine track", /obj/structure/track, 3, time = 10, one_per_turf = TRUE, on_floor = TRUE),
	new /datum/stack_recipe("cane", /obj/item/weapon/cane, 1, time = 6),
	new /datum/stack_recipe("crowbar", /obj/item/weapon/crowbar, 1, time = 6),
	new /datum/stack_recipe("screwdriver", /obj/item/weapon/screwdriver, 1, time = 12),
	new /datum/stack_recipe("wrench", /obj/item/weapon/wrench, 1, time = 6),
	new /datum/stack_recipe("spade", /obj/item/weapon/shovel/spade, 2, time = 12),
	new /datum/stack_recipe("bolt", /obj/item/weapon/arrow, 1, time = 6)
)

/obj/item/stack/rods
	name = "metal rod"
	desc = "Some rods. Can be used for building, or something."
	singular_name = "metal rod"
	icon_state = "rods"
	flags = CONDUCT
	w_class = 3.0
	force = 9.0
	throwforce = 15.0
	throw_speed = 5
	throw_range = 20
	matter = list(DEFAULT_WALL_MATERIAL = 1875)
	max_amount = 60
	attack_verb = list("hit", "bludgeoned", "whacked")

/obj/item/stack/rods/cyborg
	name = "metal rod synthesizer"
	desc = "A device that makes metal rods."
	gender = NEUTER
	matter = null
	uses_charge = 1
	charge_costs = list(500)
	stacktype = /obj/item/stack/rods

/obj/item/stack/rods/New(var/loc, var/amount=null)
	..()

	recipes = rod_recipes
	update_icon()

/obj/item/stack/rods/update_icon()
	var/amount = get_amount()
	if((amount <= 5) && (amount > 0))
		icon_state = "rods-[amount]"
	else
		icon_state = "rods"

/obj/item/stack/rods/attackby(obj/item/W as obj, mob/user as mob)
	..()
	if (iswelder(W))
		var/obj/item/weapon/weldingtool/WT = W

		if(get_amount() < 2)
			user << "<span class='warning'>You need at least two rods to do this.</span>"
			return

		if(WT.remove_fuel(0,user))
			var/obj/item/stack/material/steel/new_item = new(usr.loc)
			new_item.add_to_stacks(usr)
			for (var/mob/M in viewers(src))
				M.show_message("<span class='notice'>[src] is shaped into metal by [user.name] with the weldingtool.</span>", 3, "<span class='notice'>You hear welding.</span>", 2)
			var/obj/item/stack/rods/R = src
			src = null
			var/replace = (user.get_inactive_hand()==R)
			R.use(2)
			if (!R && replace)
				user.put_in_hands(new_item)
		return
	..()
