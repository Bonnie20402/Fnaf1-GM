

var _lock = obj_hitbox_camera.camera_lock;
var _camera_up = obj_core.gameplay.camera.camera_up;
if(_lock && _camera_up) {
	if(image_index == 0 && image_speed == 0) {
		image_speed = 1;
		obj_core.gameplay.camera.on_open_start();
	}
	if(image_index == image_number-1) {
		if(os_browser == browser_not_a_browser) {
			image_speed = 0;
			obj_hitbox_camera.camera_lock = false;
			obj_core.gameplay.camera.on_open_finish()
		}
		else {
			image_index = 0;
			image_speed = 0;
			obj_hitbox_camera.camera_lock = false;
			obj_core.gameplay.camera.on_open_finish()
		}

	}

}



else if(_lock && !_camera_up) {
	if(image_index == image_number-1 && image_speed == 0) {
		image_speed = -1;
		obj_core.gameplay.camera.on_close_start();

	}
	if(image_index == 0) {
		image_speed = 0;
		obj_hitbox_camera.camera_lock = false;
		obj_core.gameplay.camera.on_close_finish()
	}

}





