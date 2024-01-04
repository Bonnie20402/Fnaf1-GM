/// @description Send ping request
// You can write your code in this editor

alarm_set(0,ping_interval*game_get_speed(gamespeed_fps));

if(obj_fnafguard_client.client_state == CLIENTSTATE.OFFLINE) return;


buffer_fnaf_create_and_send(obj_fnafguard_client.server_connection,FNAFMESSAGE_FROM_CLIENT.PING,1);
ping_timestamp = current_time;









