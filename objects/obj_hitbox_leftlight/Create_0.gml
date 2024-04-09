/// @description Insert description here
// You can write your code in this editor

function on_leftlight_press() {
	//if you have been fucked by bonnie
	if(obj_ai_bonnie.current_camera == "Attack") {
		audio_play_sound(snd_error,0,false);
		return;
	}

	obj_gameplaycontroller_client.gameplay.left_light = !obj_gameplaycontroller_client.gameplay.left_light;

	// Window scare sound
	if(obj_gameplaycontroller_client.gameplay.left_light && obj_ai_bonnie.current_camera == "LeftWindow" && !obj_gameplaycontroller_client.gameplay.left_light_scare) {
		obj_gameplaycontroller_client.gameplay.left_light_scare = true;
		audio_play_sound(snd_window_scare,0,false);
	}
	obj_gameplaycontroller_client.gameplay.right_light = false;

	obj_night.update_power_usage();
	obj_fnafguard_client.send_gameplay_update();
}








