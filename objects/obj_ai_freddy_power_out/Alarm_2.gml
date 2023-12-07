/// @description Freddy Light Flicker
// You can write your code in this editor

alarm_set(2,0.05*game_get_speed(gamespeed_fps));
//Freddy singing phase
if(obj_ai_freddy_power_out.current_phase == 1) {
	with(obj_office) {
		image_speed = random(1) <= 0.30 ? 0 : 1;
	}
}









