/// @description Sync gameplay
// You can write your code in this editor


if(obj_fnafguard_client.is_spectating && room == rm_office) {
	obj_night.current_hours = self.current_hours;
	obj_night.current_power = self.power_left * 100;
	obj_night.current_power_usage = self.power_usage;
	
	obj_office.left_door = self.left_door;
	obj_office.left_light = self.left_light;
	obj_office.right_door = self.right_door;
	obj_office.right_light = self.right_light;
	
	obj_ai_bonnie.current_camera = self.current_bonnie_cam;
	obj_ai_chica.current_camera = self.current_chica_cam;
	obj_ai_freddy.current_camera = self.current_freddy_cam;
	obj_ai_foxy.current_camera = self.current_foxy_cam;
	
}





