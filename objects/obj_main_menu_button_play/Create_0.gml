/// @description Cool stuff
// You can write your code in this editor

button_text = "Join Lobby";

goto_room = rm_lobby;

image_alpha = 0.2;
function on_button_click() {
	if(obj_fnafguard_client.client_state != CLIENTSTATE.OFFLINE) {
		obj_input_client.run_input_lobby();
	}
	else audio_play_sound(snd_error,0,false);
}

