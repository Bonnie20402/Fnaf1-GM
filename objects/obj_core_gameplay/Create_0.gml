/// @description Insert description here
// You can write your code in this editor


gameplay = new Gameplay();

gameplay.can_scroll = true;


flush = function() {
	gameplay = new Gameplay();
	gameplay.can_scroll = true;
}


send_to_server = function() {
	var _json = json_stringify(gameplay,true);
	

}




function on_office_jumpscare() {	

	audio_stop_sound(snd_fan);
	instance_destroy(obj_office_door_left);
	instance_destroy(obj_office_door_right);
	instance_destroy(obj_office_ventilator_gif);
	instance_destroy(obj_office_leftpanel);
	instance_destroy(obj_office_rightpanel);
	instance_destroy(obj_hitbox_leftdoor);
	instance_destroy(obj_hitbox_leftlight);
	instance_destroy(obj_hitbox_rightdoor);
	instance_destroy(obj_hitbox_rightlight);
}

function on_office_power_out() {
	audio_stop_sound(snd_fan);
	instance_destroy(obj_office_ventilator_gif);
	instance_destroy(obj_office_leftpanel);
	instance_destroy(obj_office_rightpanel);
	
	if(obj_core_gameplay.gameplay.left_door || obj_core_gameplay.gameplay.right_door) audio_play_sound(snd_door,0,false);
	obj_core_gameplay.gameplay.left_door = false;
	obj_core_gameplay.gameplay.right_door = false;
	obj_core_gameplay.gameplay.left_light = false;
	obj_core_gameplay.gameplay.right_light = false;


	obj_night.update_power_usage();
	scr_camera_force_down();
	audio_stop_sound(snd_light);
	audio_play_sound(snd_power_out,0,false);
}


