/// @description Insert description here
// You can write your code in this editor

var _text = "ERROR";

switch(obj_lobby_client.lobby_state) {
	case LOBBYSTATE.OPEN:
		_text = "Waiting for master...";
		break;
	case LOBBYSTATE.STARTING:
		_text = "Starting soon...";
		break;
	case LOBBYSTATE.WAITING_FOR_LOADED_CLIENTS:
		_text = "Waiting for clients to load...";
		break;
	case LOBBYSTATE.IN_GAME:
		_text = "In-game"
		break;
}

self.text = _text;



