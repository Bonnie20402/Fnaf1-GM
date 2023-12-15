/// @description Insert description here
// You can write your code in this editor



in_lobby = false;
lobby_name = "ERROR";
lobby_state = LOBBYSTATE.ERROR
guards_left = 0;

on_lobby_state_update = function() {
	if(lobby_state == LOBBYSTATE.WAITING_FOR_LOADED_CLIENTS) {
		if(room != rm_office && room != rm_loading) room_goto(rm_loading);
	}
	if(lobby_state == LOBBYSTATE.IN_GAME && room == rm_office) {
		if(!obj_night.run_night) obj_night.on_night_start(6);
	}
}



