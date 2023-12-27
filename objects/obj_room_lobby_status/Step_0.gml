/// @description Insert description here
// You can write your code in this editor
var _text = text;
switch(obj_lobby_client.lobby_state) {
	case LOBBYSTATE.OPEN:
		text = "Waiting for master (Lobby: " + obj_lobby_client.lobby_name + " | " + "Master ID: " +string(obj_lobby_client.lobby_master)+ ")...";
		break;
	case LOBBYSTATE.STARTING:
		text = "Starting in " + string(obj_lobby_client.timer) + "s...";
		break;
	case LOBBYSTATE.WAITING_FOR_LOADED_CLIENTS:
		text = "Waiting for clients to load...";
		break;
	case LOBBYSTATE.IN_GAME:
		text = "In-game (" + string(obj_lobby_client.current_hours) + " AM - " + string(obj_lobby_client.timer) + "s) - " + string(obj_lobby_client.guards_left) + " guards remaining.";
		break;
}

if(self.text != _text) {
	audio_play_sound(snd_blop,0,false);
}




