/// @description Insert description here
// You can write your code in this editor

self.active = obj_office.current_camera == camera_button;

if(active) {
	image_speed = 1;
}
else {
	image_speed = 0;
	image_index = 0;
}

if(obj_office.camera_up) {
	x = original_x + (obj_camera_layout.x - obj_camera_layout.initial_x);
}


