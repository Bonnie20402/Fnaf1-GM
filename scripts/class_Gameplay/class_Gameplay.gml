// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Gameplay() constructor {
	
	office = new OfficeModel()
	camera = new CameraModel();
	camera_up = false;
	current_camera = "1A";
	camera_lock = false;
	jumpscared = false;
	current_bonnie_cam = "1A";
	current_chica_cam = "1A";
	current_foxy_cam = "1C_0";
	current_freddy_cam = "1A";
	current_goldenfreddy_state = 0;
	current_freddy_powerout_phase = -1;
	current_hours = 12;

	power_left = 100;
	power_usage = 1;
	
	
	
	
}	