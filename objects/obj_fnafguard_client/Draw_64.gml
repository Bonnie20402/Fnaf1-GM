/// @description Insert description here
// You can write your code in this editor


var _ui_x = 1250;
var _ui_y = 35;
var _text = "Connecting..."

draw_set_font(fnt_camera_current)
draw_set_halign(fa_right);
if(self.server_connection == -1) {
	draw_set_color(c_red);
	_text = "Disconnected";
}
else if(self.server_connection == -2) {
	draw_set_color(c_orange);
	_text = "Out of date";
}
else {
	draw_set_color(c_lime)
	_text = "Connected";
	if(obj_lobby_client.in_lobby && room != rm_lobby) {
		_text+=" (" + obj_lobby_client.lobby_name + ")";
		if(obj_lobby_client.lobby_state == LOBBYSTATE.OPEN) {
			_text+="\nWaiting for master...";
		}
		if(obj_lobby_client.lobby_state == LOBBYSTATE.STARTING) {
			_text+="\nStarting...";
		}
		if(obj_lobby_client.lobby_state == LOBBYSTATE.WAITING_FOR_LOADED_CLIENTS) {
			_text+="\nWaiting for clients...";
		}
		else if(obj_lobby_client.lobby_state == LOBBYSTATE.IN_GAME) {
			_text+= "\n" + string(obj_lobby_client.guards_left) + " guards left";
		}
		
	}	
}
draw_text(_ui_x,_ui_y,_text);
draw_set_halign(fa_center);
draw_set_color(c_white);











