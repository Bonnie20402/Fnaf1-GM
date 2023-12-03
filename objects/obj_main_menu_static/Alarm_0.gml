/// @description Insert description here
// You can write your code in this editor

alarm_set(0,static_timer*game_get_speed(gamespeed_fps));

var _alpha = 1 + irandom(3);

self.image_alpha = _alpha/10;


