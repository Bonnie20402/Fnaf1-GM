/// @description Insert description here
// You can write your code in this editor
if(!flying) return;

//check if outside office
if(!place_meeting(x,y,obj_office)) hide_rockstarfoxy_parrot();
	

x+=parrot_speed;
alarm_set(0,0.1*game_get_speed(gamespeed_fps));