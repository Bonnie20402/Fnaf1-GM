/// @description Insert description here
// You can write your code in this editor


if(obj_lobby_client.foxy_ai > 0 && obj_lobby_client.lobby_state == LOBBYSTATE.OPEN && obj_lobby_client.lobby_master == obj_fnafguard_client.client_id) {
	obj_lobby_client.foxy_ai--;
	obj_lobby_client.on_foxy_ai_update();
}
else audio_play_sound(snd_error,0,false);








