// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Gameplay() constructor {
	left_door = false;
	left_door_blocked = false;
	right_door = false;
	right_door_blocked = false;
	left_light_scare = false;
	right_light_scare = false;
	left_light = false;
	right_light = false;
	light_flickering = false;
	can_scroll = false;
	camera_up = false;
	current_camera = "N/A";
	camera_lock = false;
	jumpscared = false;
	current_bonnie_cam = "1A";
	current_chica_cam = "1A";
	current_foxy_cam = "1C_0";
	current_freddy_cam = "1A";
	current_goldenfreddy_state = 0;
	current_freddy_powerout_phase = -1;
	current_hours = 12;
	// X position of the view
	scroll_view = 0;
	power_left = 100;
	power_usage = 1;
}	