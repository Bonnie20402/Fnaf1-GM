/// @description Insert description here
// You can write your code in this editor
if(os_browser != browser_not_a_browser) return;

var _ui_x = 1250;
var _ui_y = 35;
var _text = "Connecting..."

draw_set_font(fnt_camera_current)
draw_set_halign(fa_right);
if(client_state == CLIENTSTATE.OFFLINE ) {
	draw_set_color(c_red);
	_text = "Disconnected";
}
else if(client_state == CLIENTSTATE.OUT_OF_DATE) {
	draw_set_color(c_orange)
	_text = "Out of date\nServer and Client protocol version mismatch!";
}
else {
	draw_set_color(c_lime)
	_text = "Connected (" + string(obj_ping_client.get_ping()) + " ms)";
	_text+=" (Your ID: " + string(obj_fnafguard_client.client_id) + ")";
	if(obj_lobby_client.in_lobby && room != rm_lobby) {
		
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











