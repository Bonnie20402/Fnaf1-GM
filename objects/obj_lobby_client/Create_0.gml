/// @description Insert description here
// You can write your code in this editor



in_lobby = false;
lobby_name = "ERROR";
lobby_state = LOBBYSTATE.ERROR
usernames_list = array_create(0,"");
guards_left = 0;

on_lobby_state_update = function() {
	if(lobby_state == LOBBYSTATE.WAITING_FOR_LOADED_CLIENTS) {
		if(room != rm_office && room != rm_loading) room_goto(rm_loading);
	}
	if(lobby_state == LOBBYSTATE.IN_GAME && room == rm_office) {
		if(!obj_night.run_night) obj_night.on_night_start(6);
	}
}

get_usernames_list = function() {
	var _message = "";
	for(var _i = 0; _i < array_length(usernames_list) ; _i++) {
		_message+= usernames_list[_i] + "\n";
	}
	return _message;
}


on_lobby_join = function() {
	room_goto(rm_lobby);
	obj_lobby_client.in_lobby = true;
	obj_lobby_client.lobby_name = obj_fnafguard_client.joining_lobby;
	obj_fnafguard_client.send_client_username();
}

on_lobby_quit = function() {
	obj_lobby_client.in_lobby = false;
	obj_lobby_client.lobby_name = "ERROR";
	obj_lobby_client.lobby_state = LOBBYSTATE.ERROR
	obj_lobby_client.usernames_list = array_create(0,"");
	obj_lobby_client.guards_left = 0;
	
}







