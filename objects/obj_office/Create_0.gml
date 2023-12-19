/// @description Office game variables
// optimise whatever that shit is
// light flicker

office_surface = -1;
alarm_set(0,0.1*game_get_speed(gamespeed_fps));
application_surface_draw_enable(false);
//setup sounds
audio_play_sound(snd_light,0,true);
audio_play_sound(snd_fan,0,true,0.8);

/*
	Office variables
						*/

left_light = false;
left_light_scare = false;
right_light = false;
right_light_scare = false;
left_door = false;
left_door_blocked = false;
right_door = false;
right_door_blocked = false;

jumpscared = false;

camera_up = false;
current_camera = "1A";
light_flickering = false;
can_scroll = true;

function on_office_jumpscare() {	
	buffer_fnaf_create_and_send(obj_fnafguard_client.server_connection,FNAFMESSAGE_FROM_CLIENT.NIGHTEND_UPDATE,NIGHTEND.DEATH_FREDDY);
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
	
	if(obj_office.left_door || obj_office.right_door) audio_play_sound(snd_door,0,false);
	obj_office.left_door = false;
	obj_office.right_door = false;
	obj_office.left_light = false;
	obj_office.right_light = false;
	obj_fnafguard_client.send_leftdoor_state();
	obj_fnafguard_client.send_rightdoor_state();
	obj_fnafguard_client.send_leftlight_update();
	obj_fnafguard_client.send_rightlight_update();
	obj_night.update_power_usage();
	scr_camera_force_down();
	audio_stop_sound(snd_light);
	audio_play_sound(snd_power_out,0,false);
}



