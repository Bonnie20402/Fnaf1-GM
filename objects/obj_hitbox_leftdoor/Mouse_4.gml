
if(obj_core_gameplay.gameplay.camera_up || obj_night.current_power == 0) return;

if(obj_ai_bonnie.current_camera == "Attack") {
	audio_play_sound(snd_error,0,false);
	return;
}

if(!obj_hitbox_leftdoor.door_lock) {
	obj_core_gameplay.gameplay.left_door = !obj_core_gameplay.gameplay.left_door;
	play_door_sound();
	obj_night.update_power_usage(); 
	
}
	






