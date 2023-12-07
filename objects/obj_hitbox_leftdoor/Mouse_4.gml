if(obj_office.camera_up || obj_night.current_power == 0) return;

if(obj_ai_bonnie.current_camera == "AttackSuccess") {
	audio_play_sound(snd_error,0,false);
	return;
}

if(!obj_hitbox_leftdoor.door_lock) {
	obj_office.left_door = !obj_office.left_door;
	play_door_sound();
	obj_night.update_power_usage();
}
	






