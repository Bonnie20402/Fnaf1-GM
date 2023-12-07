/// @description Freddy black out jumpscare
// You can write your code in this editor


if(obj_ai_freddy_power_out.current_phase == 2) {
	alarm_set(1,2*game_get_speed(gamespeed_fps));
	var _number = random(1);
	if(_number <= 0.20) {
		audio_play_sound(snd_jumpscare,0,false);
		with (obj_office) {
			depth = -1987;
			sprite_index = spr_office_jumpscare_freddy_powerout;
			image_index = 0;
			image_speed = 1;
		}
		alarm_set(3,0.75*game_get_speed(gamespeed_fps));
	}
	else  {
		obj_ai_freddy_power_out.misses++;
		on_miss_update();
	}
}










