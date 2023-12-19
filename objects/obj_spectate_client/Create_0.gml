//SPECTATOR VARIABLES
left_door = false;
right_door = false;
left_light = false;
right_light = false;
camera_up = false;
current_camera = "N/A";
camera_lock = false;
current_bonnie_cam = "1A";
current_chica_cam = "1A";
current_foxy_cam = "1C_0";
current_freddy_cam = "1A";
current_goldenfreddy_state = 0;
current_freddy_powerout_phase = -1;
current_hours = 12;
power_left = 100;
power_usage = 1;

#region Util

/// toString()
/// Returns a string containing the values of all variables.

flush = function() {
	left_door = false;
	right_door = false;
	left_light = false;
	right_light = false;
	camera_up = false;
	current_camera = "N/A";
	camera_lock = false;
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

to_string = function(){
    var _result = "";
    
    // Print each variable and add a newline
    _result += "left_door = " + string(left_door) + ";\n";
    _result += "right_door = " + string(right_door) + ";\n";
    _result += "left_light = " + string(left_light) + ";\n";
    _result += "right_light = " + string(right_light) + ";\n";
    _result += "camera_up = " + string(camera_up) + ";\n";
    _result += "current_camera = " + string(current_camera) + ";\n";
    _result += "camera_lock = " + string(camera_lock) + ";\n";
    _result += "current_bonnie_cam = " + string(current_bonnie_cam) + ";\n";
    _result += "current_chica_cam = " + string(current_chica_cam) + ";\n";
    _result += "current_foxy_cam = " + string(current_foxy_cam) + ";\n";
    _result += "current_freddy_cam = " + string(current_freddy_cam) + ";\n";
    _result += "current_goldenfreddy_state = " + string(current_goldenfreddy_state) + ";\n";
    _result += "current_freddy_powerout_phase = " + string(current_freddy_powerout_phase) + ";\n";
    _result += "current_hours = " + string(current_hours) + ";\n";
    _result += "power_left = " + string(power_left) + ";\n";
    _result += "power_usage = " + string(power_usage) + ";\n";
    
    return _result;
}

#endregion


//NOTE: As long as camera up in sync, bonnie and chica attacks are actually automatically done.
on_bonnie_update = function() {
	if(room == rm_office)   {
		if(current_bonnie_cam != "AttackSuccess")obj_ai_bonnie.on_animatronic_move();
		else obj_ai_bonnie.on_animatronic_jumpscare();
	}
}
on_chica_update = function() {
	if(room == rm_office) {
		if(current_chica_cam != "AttackSuccess")obj_ai_chica.on_animatronic_move();
		else obj_ai_chica.on_animatronic_jumpscare();
	}
}
on_freddy_update = function() {
	if(room == rm_office) {
		if(current_freddy_cam == "AttackSuccess") {
			obj_ai_freddy.on_animatronic_jumpscare();
		}
		else {
			obj_ai_freddy.on_animatronic_move();
		}
	}
}
on_door_update = function() {
	if(room == rm_office) {
		audio_play_sound(snd_door,0,false);
	}
}

on_foxy_update = function() {
	if(room == rm_office) {
		if(current_foxy_cam == "AttackSuccess")obj_ai_foxy.on_animatronic_jumpscare();
		else obj_ai_foxy.on_animatronic_move();
	}
	
}

on_freddy_powerout_update = function() {
	if(room == rm_office) {
		obj_ai_freddy_power_out.current_phase = self.current_freddy_powerout_phase;
		obj_ai_freddy_power_out.on_phase_update();
	}
}

on_powerleft_update = function() {
	if(room == rm_office) {
		obj_night.current_power = self.power_left;
		obj_night.on_power_update();
	}
}

on_goldenfreddy_update = function() {
	if(room == rm_office) {
		if(self.current_goldenfreddy_state == 0) obj_ai_goldenfreddy.on_goldenfreddy_disappear();
		else if(self.current_goldenfreddy_state == 1) obj_ai_goldenfreddy.on_goldenfreddy_appear();
		else if (self.current_goldenfreddy_state == 2) obj_ai_goldenfreddy.on_animatronic_jumpscare();
	}
}

on_cameraup_update = function() {
	if(room == rm_office) {
		if(camera_up) scr_camera_force_up();
		else scr_camera_force_down();
	}
}