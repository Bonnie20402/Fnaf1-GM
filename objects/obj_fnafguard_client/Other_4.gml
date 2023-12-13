/// @description Send client state
// You can write your code in this editor

var _state = 0;

if(room == rm_main_menu) {
	_state = CLIENTSTATE.MAIN_MENU;
}

if(room == rm_game_over) {
	_state = CLIENTSTATE.GAME_OVER;
}

if(room == rm_loading) {
	_state = CLIENTSTATE.LOADING;
}

if(room = rm_office) {
	_state = CLIENTSTATE.OFFICE;
}

obj_fnafguard_client.client_state = _state;
obj_fnafguard_client.send_client_state();








