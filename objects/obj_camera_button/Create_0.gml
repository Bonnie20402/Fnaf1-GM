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


function on_button_click() {
	//Loop through all button instances and put them in their "desactivated" state.
	with(obj_camera_button) self.camera_button_frame_on = false;
	//put this button into activated mode
	self.camera_button_frame_on = true;
	//start the blinking timer
	alarm_set(0,1*game_get_speed(gamespeed_fps));
	//update game variables
	obj_core_gameplay.gameplay.current_camera = self.camera_button;
	obj_camera_string.set_camera_current_string(self.camera_text); 
	//call my event
	scr_on_camera_change_start();
}




