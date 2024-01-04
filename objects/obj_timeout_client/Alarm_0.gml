/// @description Office loading decrease
// You can write your code in this editor


if(office_loading_time_left>0 && room == rm_office) {
	office_loading_time_left--;
	alarm_set(0,1*game_get_speed(gamespeed_fps));
}









