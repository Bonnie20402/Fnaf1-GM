/// @description Insert description here
// You can write your code in this editor


audio_stop_all();
audio_play_sound(snd_main_menu0,0,true,0.3);


if(obj_fnafguard_client.server_connection == 0) {
	obj_fnafguard_client.client_state = CLIENTSTATE.MAIN_MENU;
	obj_fnafguard_client.send_client_state();
}





