/// @description Blink variable and bink alarm
// You can write your code in this editor

alarm_set(0,1.8*game_get_speed(gamespeed_fps));
alarm_set(1,0.2*game_get_speed(gamespeed_fps));
_rec_off = false;

_camera_change_effect_frame = 0;

_camera_static_frame = 0;



