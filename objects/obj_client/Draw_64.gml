/// @description Insert description here
// You can write your code in this editor

if(!global.IS_CLIENT) return;

var _ui_x = 1150;
var _ui_y = 35;
var _text = "Connecting..."

draw_set_font(fnt_camera_current)
if(self.client_id == -1) {
	draw_set_color(c_red);
	_text = "Disconnected";
}
else {
	draw_set_color(c_lime)
	_text = "Connected";
}
draw_text(_ui_x,_ui_y,_text);
draw_set_color(c_white);











