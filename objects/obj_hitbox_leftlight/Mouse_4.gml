if(obj_office.camera_up || obj_night.current_power == 0) return;


//if you have been fucked by bonnie
if(obj_ai_bonnie.current_camera == "AttackSuccess") {
	audio_play_sound(snd_error,0,false);
	return;
}

obj_office.left_light = !obj_office.left_light;

// Window scare sound
if(obj_office.left_light && obj_ai_bonnie.current_camera == "LeftWindow" && !obj_office.left_light_scare) {
	obj_office.left_light_scare = true;
	audio_play_sound(snd_window_scare,0,false);
}
obj_office.right_light = false;

obj_night.update_power_usage();





