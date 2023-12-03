/// @description Office game variables
// optimise whatever that shit is
// light flicker

office_surface = -1;
alarm_set(0,0.1*game_get_speed(gamespeed_fps));

application_surface_draw_enable(false);
//setup sounds
audio_play_sound(snd_light,0,true);

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



