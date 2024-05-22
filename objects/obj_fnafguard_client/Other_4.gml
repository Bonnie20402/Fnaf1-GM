/// @description Send client state
// You can write your code in this editor

var _state = 0;
if(client_state == CLIENTSTATE.OFFLINE) return;
if(room == rm_main_menu) {
	_state = CLIENTSTATE.MAIN_MENU;
}

if(room == rm_game_over) {
	_state = CLIENTSTATE.GAME_OVER;
}

if(room == rm_loading) {
	_state = CLIENTSTATE.LOADING;
}

if(room == rm_settings) {
	_state = CLIENTSTATE.MAIN_MENU;
}

if(room == rm_lobby) {
	_state = CLIENTSTATE.LOBBY_MENU;
}
if(room == rm_6_am) {
	_state = CLIENTSTATE.GAME_WIN;
}
if(room = rm_office) {
	if(obj_fnafguard_client.is_spectating) {
		_state = CLIENTSTATE.SPECTATING;
	}
	else _state = CLIENTSTATE.OFFICE;
}


obj_fnafguard_client.client_state = _state;
obj_fnafguard_client.on_clientstate_update();










