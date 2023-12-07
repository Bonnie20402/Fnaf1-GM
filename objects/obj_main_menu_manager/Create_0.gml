/// @description Insert description here
// You can write your code in this editor

freddy_weird_time = 2;
freddy_normal_time = 0.3;

obj_night.current_night = 6;
alarm_set(0,freddy_weird_time*game_get_speed(gamespeed_fps));
alarm_set(1,freddy_normal_time*game_get_speed(gamespeed_fps));



