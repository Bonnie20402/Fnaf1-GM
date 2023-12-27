/// @description Insert description here
// You can write your code in this editor

if(obj_lobby_client.lobby_master == obj_fnafguard_client.client_id) {
	if(obj_lobby_client.lobby_state == LOBBYSTATE.OPEN || obj_lobby_client.lobby_state == LOBBYSTATE.STARTING) buffer_fnaf_create_and_send(obj_fnafguard_client.server_connection,FNAFMESSAGE_FROM_CLIENT.LOBBY_STARTMATCH_REQUEST,1);
	else audio_play_sound(snd_error,0,false);
}
else audio_play_sound(snd_error,0,false);







