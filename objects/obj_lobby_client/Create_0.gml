/// @description Insert description here
// You can write your code in this editor



in_lobby = false;
lobby_name = "ERROR";
lobby_state = LOBBYSTATE.ERROR
usernames_list = array_create(0,"");
guards_left = 0;

freddy_ai = 1;
bonnie_ai = 9;
chica_ai = 8;
foxy_ai = 7;
timer = 0;
current_hours = 0;


#region Lobby menu stuff - send to server
on_bonnie_ai_update = function() {
	buffer_fnaf_create_and_send(obj_fnafguard_client.server_connection,FNAFMESSAGE_FROM_CLIENT.LOBBY_BONNIEAI_UPDATE_REQUEST,bonnie_ai);
}
on_chica_ai_update = function() {
	buffer_fnaf_create_and_send(obj_fnafguard_client.server_connection,FNAFMESSAGE_FROM_CLIENT.LOBBY_CHICAAI_UPDATE_REQUEST,chica_ai);
}
on_freddy_ai_update = function() {
	buffer_fnaf_create_and_send(obj_fnafguard_client.server_connection,FNAFMESSAGE_FROM_CLIENT.LOBBY_FREDDYAI_UPDATE_REQUEST,freddy_ai);
}
on_foxy_ai_update = function() {
	buffer_fnaf_create_and_send(obj_fnafguard_client.server_connection,FNAFMESSAGE_FROM_CLIENT.LOBBY_FOXYAI_UPDATE_REQUEST,foxy_ai);
}
#endregion
on_lobby_state_update = function() {
	if(lobby_state == LOBBYSTATE.WAITING_FOR_LOADED_CLIENTS) {
		if(room != rm_office && room != rm_loading) room_goto(rm_loading);
	}
	if(lobby_state == LOBBYSTATE.IN_GAME && room == rm_office) {
		if(!obj_night.run_night) obj_night.on_night_start(7);
	}
}

on_lobby_hours_update = function() {
	if(room == rm_office && !obj_fnafguard_client.is_spectating) {
		obj_night.current_hours = current_hours;
		obj_night.on_hour_update();
	} 

}

on_lobby_timer_update = function() { return; } 

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







