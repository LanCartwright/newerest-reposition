#if !defined(using_map_DATUM)

//	#include "winterstorm1.dmm"
//	#include "winterstorm3.dmm"
//	#include "winterstorm4.dmm"
//	#include "winterstorm5.dmm"
	#include "testman.dmm"

	#define using_map_DATUM /datum/map/

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Torch

#endif


/obj/effect/light_emitter
	name = "Light-emtter"
	anchored = 1
	unacidable = 1
	luminosity = 8