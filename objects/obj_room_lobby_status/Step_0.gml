/// @description Insert description here
// You can write your code in this editor
var _text = text;
switch(obj_lobby_client.lobby_state) {
	case LOBBYSTATE.OPEN:
		text = "Waiting for master (Master ID: " +string(obj_lobby_client.lobby_master)+ ")...";
		break;
	case LOBBYSTATE.STARTING:
		text = "Starting soon...";
		break;
	case LOBBYSTATE.WAITING_FOR_LOADED_CLIENTS:
		text = "Waiting for clients to load...";
		break;
	case LOBBYSTATE.IN_GAME:
		text = "In-game";
		break;
}

if(self.text != _text) {
	audio_play_sound(snd_blop,0,false);
}




