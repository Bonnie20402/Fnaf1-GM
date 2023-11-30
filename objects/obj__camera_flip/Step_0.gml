

var _lock = obj_hitbox_camera.camera_lock;
var _camera_up = obj_office.camera_up;
if(_lock && _camera_up) {
	if(image_index == 0 && image_speed == 0) {
		image_speed = 1;
		audio_play_sound(snd_camera_up,0,false);
	}
	if(image_index == image_number-1) {
		image_speed = 0;
		obj_hitbox_camera.camera_lock = false;

	}

}



else if(_lock && !_camera_up) {
	if(image_index == image_number-1 && image_speed == 0) {
		image_speed = -1;
		audio_play_sound(snd_camera_down,0,false);
		audio_stop_sound(snd_camera_up);
	}
	if(image_index == 0) {
		image_speed = 0;
		obj_hitbox_camera.camera_lock = false;
	}

}









