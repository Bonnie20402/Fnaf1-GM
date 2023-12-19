/// @description Insert description here
// You can write your code in this editor
if(obj_fnafguard_client.is_spectating) {
	buffer_fnaf_create_and_send(obj_fnafguard_client.server_connection,FNAFMESSAGE_FROM_CLIENT.SPECTATE_QUIT,1);
	room_goto(rm_main_menu);
}





