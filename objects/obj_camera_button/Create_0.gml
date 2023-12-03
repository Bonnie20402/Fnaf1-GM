/// @description Insert description here
// You can write your code in this editor
depth = -5;
initial_x = x;
initial_y = y;
camera_button = "1A";
camera_text = "Show Stage";

camera_button_frame_on = false;
mouse_gui_x =  0;
mouse_gui_y = 0;
active = false;


function set_camera_button(_button) {
	self.camera_button = _button;
}

function set_camera_text(_text) {
	self.camera_text = _text;
}

function get_camera_text() {
	return self.camera_text;
}





