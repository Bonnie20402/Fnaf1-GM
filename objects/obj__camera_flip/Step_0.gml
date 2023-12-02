

var _lock = obj_hitbox_camera.camera_lock;
var _camera_up = obj_office.camera_up;
if(_lock && _camera_up) {
	if(image_index == 0 && image_speed == 0) {
		image_speed = 1;
		scr_on_camera_open_start();
	}
	if(image_index == image_number-1) {
		image_speed = 0;
		obj_hitbox_camera.camera_lock = false;
		scr_on_camera_open_finish();

		

	}

}



else if(_lock && !_camera_up) {
	if(image_index == image_number-1 && image_speed == 0) {
		image_speed = -1;
		scr_on_camera_close_start();

	}
	if(image_index == 0) {
		image_speed = 0;
		obj_hitbox_camera.camera_lock = false;
		scr_on_camera_close_finish();
	}

}









