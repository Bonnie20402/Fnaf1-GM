/// @description Insert description here
// You can write your code in this editor

var _newtext = "";

_newtext+=" - LOBBY INFO - \n";

_newtext+="Lobby: " + obj_lobby_client.lobby_name + "\n";

_newtext+="Your client ID: " + string(obj_fnafguard_client.client_id) + "\n";

_newtext+= "Lobby Master: " + string(obj_lobby_client.lobby_master) + "\n";

switch(obj_lobby_client.lobby_state) {
	case LOBBYSTATE.OPEN:
		_newtext+="Waiting for players...\n";
		break;
	case LOBBYSTATE.IN_GAME:
		_newtext+="In-game (00:00)\n";
}


text = _newtext;









