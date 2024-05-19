/// @description Scale update
// You can write your code in this editor
if(timer>0) {
	image_yscale-=0.035;
	alarm_set(0,0.1*game_get_speed(gamespeed_fps));
}
