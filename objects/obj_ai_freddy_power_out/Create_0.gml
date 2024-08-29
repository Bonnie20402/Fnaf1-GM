/// @description Freddy (power out) AI
// You can write your code in this editor


/*

	States:
	OFF -> -1;
	WALKING_TO_OFFICE -> 0
	MUSIC_BOX -> 1
	ATTACK -> 2
				*/


// Power out
/*
	All AI should be halted.
	Once power is out:
	Every 5 seconds there is a 20% chance of freddy to show up and start music box.
	If he misses 3 times ,he'll guranteed show at the 4th time.
	Same bs for music box jingle
		on black out:
			20% chance every 2 seconds of getting jumppscared.
			
			*/
current_phase = -1;
misses = 0;
//Freddy light flicker
alarm_set(2,0.05*game_get_speed(gamespeed_fps));

function halt_animatronic_ai() {
	obj_ai_freddy.use_ai = false;
	obj_ai_bonnie.use_ai = false;
	obj_ai_chica.use_ai = false;
	obj_ai_foxy.use_ai = false;
}

function on_power_out() {
	audio_stop_sound(snd_freddy_song);
	halt_animatronic_ai();
	current_phase = 0;
	on_phase_update();
	// Jingle and Walking alarm
	alarm_set(0,5*game_get_speed(gamespeed_fps));
	
}

function on_phase_update() {
	misses = 0;
	
	obj_core_gameplay.gameplay.current_freddy_powerout_phase = current_phase;
	


	if(current_phase == 0) {
		with(obj_office) {
			sprite_index = spr_office_powerless;
			image_speed = 0;
			image_index = 0;
		}
	}
	if(current_phase == 1) {
		audio_stop_sound(snd_walk);
		audio_play_sound(snd_freddy_song,0,false,1);

		
	}
	//Blackout alarm
	else if(current_phase == 2) {
		audio_stop_sound(snd_freddy_song);
		with(obj_office) {
			sprite_index = spr_office_blackout
			image_speed = 0;
			image_index = 0;
		}
		alarm_set(1,2*game_get_speed(gamespeed_fps));
		
	}
	else if(current_phase == 3) {
		obj_ai_freddy_power_out.on_animatronic_jumpscare();
	}
}

function on_miss_update() {
	if(current_phase == 0 || current_phase == 2) {
		if(misses%2 !=0) {
			if(!audio_is_playing(snd_walk) ) {
				audio_play_sound(snd_walk,0,false,current_phase == 0 ? 0.3 : 0.6);
			}
		}
	}
	
}

function on_animatronic_jumpscare() {
	audio_play_sound(snd_jumpscare,0,false);
	var _death = json_stringify(new GuardDeath(obj_fnafguard_client.client_id,0,GUARDDEATHCAUSE.BY_FREDDY_POWEROUT,obj_fnafguard_client.username),true);
	buffer_fnaf_create_and_send(obj_fnafguard_client.server_connection,FNAFMESSAGE_FROM_CLIENT.CLASS_GUARDDEATH,_death);
	with (obj_office) {
		depth = -1987;
		sprite_index = spr_office_jumpscare_freddy_powerout;
		image_index = 0;
		image_speed = 1;
	}
	alarm_set(3,0.75*game_get_speed(gamespeed_fps));
}







