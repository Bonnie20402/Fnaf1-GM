/// @description Insert description here
// You can write your code in this editor

image_speed = 0;
visible = false;
self.depth = -2;
original_x = x;
camera_button = "1A";
camera_text = "Show Stage";

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





