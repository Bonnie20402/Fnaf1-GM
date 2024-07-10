/// @description Insert description here
// You can write your code in this editor
og_x = x;
og_y = y;
enabled = true;
// appear chance 60%
appear_chance = 0.6;
//30 sec i think
move_timer = 30;
alarm_set(1,move_timer*game_get_speed(gamespeed_fps));
visible = false;
// low depth to be above the doors
depth = -1
flying = false;
parrot_speed = 14;
show_rockstarfoxy_parrot = function() {
	obj_paranoia_redacted.start_hallucinating();
	if(!obj_night.run_night || obj_night.current_power <= 1) return;
	else if(obj_ai_rockstarfoxy.foxy_visible) return;
	if(!flying) {
		x = og_x;
		visible = true;
		flying = true;
		var _sound = 1 + irandom(4);
		if(_sound == 1) audio_play_sound(snd_ucn_parrot1,1,false);
		if(_sound == 2) audio_play_sound(snd_ucn_parrot2,1,false);
		if(_sound == 3) audio_play_sound(snd_ucn_parrot3,1,false);
		if(_sound == 4) audio_play_sound(snd_ucn_parrot4,1,false);
		alarm_set(0,0.1*game_get_speed(gamespeed_fps))
	}
}

hide_rockstarfoxy_parrot = function() {
	flying=false;
	visible=false;
}

on_rockstarfoxy_parrot_click = function() {
	visible = false;
	flying=false;
	obj_ai_rockstarfoxy.show_rockstar_foxy();
}