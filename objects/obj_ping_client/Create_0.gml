/// @description Insert description here
// You can write your code in this editor

ping_interval = 0.2;
alarm_set(0,ping_interval*game_get_speed(gamespeed_fps));
current_ping = 0;


ping_timestamp = current_time;
pong_timestamp = current_time;

get_ping = function() { return current_ping; }



update_ping = function() { 
	current_ping = pong_timestamp - ping_timestamp;
	 
}






