/// @description Insert description here
// You can write your code in this editor


function on_rightlight_press() {
	if(obj_ai_chica.current_camera == "Attack") {
		audio_play_sound(snd_error,0,false);
		return;
	}

	// Window scare sound
	if(!obj_core_gameplay.gameplay.right_light && obj_ai_chica.current_camera == "RightWindow" && !obj_core_gameplay.gameplay.right_light_scare) {
		obj_core_gameplay.gameplay.right_light_scare = true;
		audio_play_sound(snd_window_scare,0,false);
	}

	obj_core_gameplay.gameplay.right_light = !obj_core_gameplay.gameplay.right_light;
	obj_core_gameplay.gameplay.left_light = false;
	obj_night.update_power_usage();
	

}







