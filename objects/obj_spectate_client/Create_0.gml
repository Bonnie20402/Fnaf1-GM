

gameplay = new Gameplay();
gameplay.can_scroll = false;
#region Util

/// toString()
/// Returns a string containing the values of all variables.

flush = function() {
	gameplay = new Gameplay();
	gameplay.can_scroll = false;
	update_gameplay(new Gameplay());
}

#endregion

update_gameplay = function(_newgameplay) {
	if(!obj_fnafguard_client.is_spectating) return;
	var _previousgameplay = variable_clone(gameplay);
	gameplay = _newgameplay;
	
	if(room == rm_office) {
		obj_gameplaycontroller_client.gameplay = gameplay;
		if(gameplay.current_bonnie_cam != _previousgameplay.current_bonnie_cam) {
			on_bonnie_update();
		}
		if(gameplay.current_chica_cam != _previousgameplay.current_chica_cam) {
			on_chica_update();
		}
		if(gameplay.current_freddy_cam != _previousgameplay.current_freddy_cam) {
			on_freddy_update();
		}
		if(gameplay.current_foxy_cam != _previousgameplay.current_foxy_cam) {
			on_foxy_update();
		}
		if(gameplay.left_door != _previousgameplay.left_door or gameplay.right_door != _previousgameplay.right_door) {
			on_door_update();
		}
		if(gameplay.current_freddy_powerout_phase != _previousgameplay.current_freddy_powerout_phase) {
			on_freddy_powerout_update();
			show_message("freddy sus");
		}
		if(gameplay.current_camera != _previousgameplay.current_camera) {
			on_currentcamera_update();
		}	
		if(gameplay.camera_up != _previousgameplay.camera_up) {
			on_cameraup_update();
		}	
	}
	on_gameplay_update();
	
}
on_gameplay_update = function() {
	if(room == rm_office) {
		obj_office_scroller.x = gameplay.scroll_view;
		obj_night.current_power = gameplay.power_left;
		obj_night.current_power_usage = gameplay.power_usage;
		obj_night.current_hours = gameplay.current_hours;
		obj_night.on_power_update();
		return;
	}
}

//NOTE: As long as camera up in sync, bonnie and chica attacks are actually automatically done.
on_bonnie_update = function() {
	if(gameplay.current_bonnie_cam != "AttackSuccess")obj_ai_bonnie.on_animatronic_move();
	else obj_ai_bonnie.on_animatronic_jumpscare();
}
on_chica_update = function() {
	if(room == rm_office) {
		if(gameplay.current_chica_cam != "AttackSuccess")obj_ai_chica.on_animatronic_move();
		else obj_ai_chica.on_animatronic_jumpscare();
	}
}
on_freddy_update = function() {
	if(room == rm_office) {
		if(gameplay.current_freddy_cam == "AttackSuccess") {
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
		if(gameplay.current_foxy_cam == "AttackSuccess")obj_ai_foxy.on_animatronic_jumpscare();
		else obj_ai_foxy.on_animatronic_move();
	}
	
}

on_freddy_powerout_update = function() {
	if(room == rm_office) {
		obj_ai_freddy_power_out.current_phase = gameplay.current_freddy_powerout_phase;
		obj_ai_freddy_power_out.on_phase_update();
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
		if(gameplay.camera_up) scr_camera_force_up();
		else scr_camera_force_down();
	}
}

on_currentcamera_update = function() {
	if(room == rm_office) {
		obj_camera_current_spr.update_current_camera_sprite();
		with(obj_camera_button) {
			if(self.camera_button == other.gameplay.current_camera) {
				self.on_button_click();
			}
		}
	}
}

on_nightstate_update = function() {
	if (night_state == NIGHTEND.WIN) {
		room_goto(rm_6_am);
	}
}