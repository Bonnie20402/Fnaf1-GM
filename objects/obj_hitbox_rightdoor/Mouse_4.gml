
if(obj_office.camera_up) return;

if(obj_ai_chica.current_camera == "AttackSuccess") {
	audio_play_sound(snd_error,0,false);
	return;
}

if(!obj_hitbox_rightdoor.door_lock) {
	obj_office.right_door = !obj_office.right_door;
	play_door_sound();
	
}






