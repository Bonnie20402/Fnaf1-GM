if(obj_fnafguard_client.is_spectating) return;
if(obj_office.camera_up || obj_night.current_power == 0) return;

if(obj_ai_chica.current_camera == "AttackSuccess") {
	audio_play_sound(snd_error,0,false);
	return;
}

if(!obj_hitbox_rightdoor.door_lock) {
	obj_office.right_door = !obj_office.right_door;
	play_door_sound();
	obj_night.update_power_usage();
	obj_fnafguard_client.send_rightdoor_state();
}






