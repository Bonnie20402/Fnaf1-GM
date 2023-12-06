


if(obj_office.camera_up) return;

if(obj_ai_chica.current_camera == "AttackSuccess") {
	audio_play_sound(snd_error,0,false);
	return;
}

// Window scare sound
if(!obj_office.right_light && obj_ai_chica.current_camera == "RightWindow" && !obj_office.right_light_scare) {
	obj_office.right_light_scare = true;
	audio_play_sound(snd_window_scare,0,false);
}

obj_office.right_light = !obj_office.right_light;
obj_office.left_light = false;
obj_night.update_power_usage();




