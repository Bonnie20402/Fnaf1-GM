/// @description Insert description here
// You can write your code in this editor


var _ui_x = 1150;
var _ui_y = 35;
var _text = "Connecting..."

draw_set_font(fnt_camera_current)
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
	if(self.actual_lobby != "") {
		_text+=" (" + self.actual_lobby + ")";
		if(self.client_state == CLIENTSTATE.OFFICE) {
		if(obj_night.run_night) _text+="\n" + string(guards_alive) + " guards left.";
		else _text+="\nWaiting..."
	}
	
		
	}
}
draw_text(_ui_x,_ui_y,_text);
draw_set_color(c_white);











