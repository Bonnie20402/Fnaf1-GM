/// @description Keep-alive timeout
// You can write your code in this editor

if(!global.IS_CLIENT || server_connection == -1 || server_connection == -2) return;

alarm_set(0,0.1*game_get_speed(gamespeed_fps));
if((current_time - obj_client.keep_alive_timestamp) > timeout) {
	obj_client.on_client_disconnect();
}










