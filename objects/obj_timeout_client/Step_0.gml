/// @description Insert description here
// You can write your code in this editor
if(obj_fnafguard_client.client_state == CLIENTSTATE.OFFLINE || room == rm_loading) return;


if(current_time - last_packet > timeout_time && office_loading_time_left == 0) {
	obj_fnafguard_client.on_client_disconnect();
}











