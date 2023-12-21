/// @description Insert description here
// You can write your code in this editor

if(obj_lobby_client.lobby_state == LOBBYSTATE.IN_GAME) {
	obj_input_client.run_input_spectate_target();
}
else audio_play_sound(snd_error,0,false);







