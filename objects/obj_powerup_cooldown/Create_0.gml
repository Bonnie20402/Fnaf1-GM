/// @description Insert description here
// You can write your code in this editor


timer = 0;


function run(_time) {
	timer=_time;
	 image_yscale = 1;
	//scale update
	alarm_set(0,0.1*game_get_speed(gamespeed_fps));
	//timer
	alarm_set(1,1*game_get_speed(gamespeed_fps))
}