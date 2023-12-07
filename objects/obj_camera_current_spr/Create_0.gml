/// @description Insert description here
// You can write your code in this editor

self.depth = -5;

disabled = false;


function disable_camera() {
	if(disabled)return;
	disabled=true;
	scr_play_camera_disable_sound();
	alarm_set(0,random_range(3,9)*game_get_speed(gamespeed_fps));
}
function update_current_camera_sprite() {
	//TODO: Add foxy and golden freddy
	var _guard_cam = obj_office.current_camera;
	var _freddy_cam = obj_ai_freddy.current_camera;
	var _bonnie_cam = obj_ai_bonnie.current_camera;
	var _chica_cam = obj_ai_chica.current_camera;
	var _foxy_cam = obj_ai_foxy.current_camera;
	var _new_index = spr_cameras_6_empty;
	if(_guard_cam == "6" || disabled) {
		sprite_index = spr_cameras_6_empty;
		return;
	}

	if (_guard_cam == "1A") {
	    if (_freddy_cam == "1A" && _bonnie_cam == "1A" && _chica_cam == "1A") {
	        _new_index = spr_cameras_1a_bonnie1freddy1chica1;
	    } else if (_freddy_cam == "1A" && _bonnie_cam == "1A" && _chica_cam != "1A") {
	        _new_index = spr_cameras_1a_bonnie1freddy1chica0;
	    } else if (_freddy_cam == "1A" && _bonnie_cam != "1A" && _chica_cam == "1A") {
	        _new_index = spr_cameras_1a_bonnie0freddy1chica1;
	    } else if (_freddy_cam == "1A" && _bonnie_cam != "1A" && _chica_cam != "1A") {
	        _new_index = spr_cameras_1a_bonnie0freddy1chica0;
	    } else if (_freddy_cam != "1A" && _bonnie_cam != "1A" && _chica_cam != "1A") {
	        _new_index = spr_cameras_1a_bonnie0freddy0chica0;
		}
	}
	if (_guard_cam == "1B") {
		// all of them
	    if (_freddy_cam == "1B" && _bonnie_cam == "1B" && _chica_cam == "1B") {
	        _new_index = spr_cameras_1b_bonnie1freddy0chica1;
		//freddy and bonnie
	    } else if (_freddy_cam == "1B" && _bonnie_cam == "1B" && _chica_cam != "1B") {
	        _new_index = spr_cameras_1b_bonnie1freddy0chica0;
		//freddy and chica
	    } else if (_freddy_cam == "1B" && _bonnie_cam != "1B" && _chica_cam == "1B") {
	        _new_index = spr_cameras_1b_bonnie0freddy0chica1;
		//freddy only
	    } else if (_freddy_cam == "1B" && _bonnie_cam != "1B" && _chica_cam != "1B") {
	        _new_index = spr_cameras_1b_bonnie0freddy1chica0;
		//chica only
		} else if (_freddy_cam != "1B" && _bonnie_cam != "1B" && _chica_cam == "1B") {
	        _new_index = spr_cameras_1b_bonnie0freddy0chica1;
		// bonnie and chica
		} else if (_freddy_cam != "1B" && _bonnie_cam == "1B" && _chica_cam == "1B") {
	        _new_index = spr_cameras_1b_bonnie1freddy0chica1;
		//bonnie only
		} else if (_freddy_cam != "1B" && _bonnie_cam == "1B" && _chica_cam != "1B") {
	        _new_index = spr_cameras_1b_bonnie1freddy0chica0;
	    //empty
		} else if (_freddy_cam != "1B" && _bonnie_cam != "1B" && _chica_cam != "1B") {
	        _new_index = spr_cameras_1b_bonnie0freddy0chica0;
	    }
	} 
	if (_guard_cam == "1C") {
		if( _foxy_cam == "1C_0" ) {
			_new_index = spr_cameras_1c_foxy1_phase0;
		} else if( _foxy_cam == "1C_1" ) {
			_new_index = spr_cameras_1c_foxy1_phase1;
		} else if( _foxy_cam == "1C_2" ) {
			_new_index = spr_cameras_1c_foxy1_phase2;
		} else {
			_new_index = spr_cameras_1c_foxy0;
		}
	}
	if (_guard_cam == "5") {
	    if (_bonnie_cam == "5") {
	        var _creepy = random(10);
	        _new_index = (_creepy < 3) ? spr_cameras_5_bonnie1_creepy : spr_cameras_5_bonnie1;
	    } else if(_bonnie_cam != "5") {
	        _new_index = spr_cameras_5_bonnie0;
	    }
	} 
	if (_guard_cam == "3") {
	    if (_bonnie_cam == "3") {
	        _new_index = spr_cameras_3_bonnie1;
	    } else if(_bonnie_cam != "3") {
	        _new_index = spr_cameras_3_bonnie0;
	    }
	}
	if (_guard_cam == "2A") {
	    if (_bonnie_cam == "2A") {
	        _new_index = spr_cameras_2a_bonnie1foxy0;
	    } else if(_bonnie_cam != "2A") {
	        _new_index = spr_cameras_2a_bonnie0foxy0;
	    }
		if(_foxy_cam == "2A" && obj_office.camera_up && !obj_ai_foxy.is_running) {
			obj_ai_foxy.is_running = true;
			_new_index = spr_cameras_2a_bonnie0foxy1;
			image_index = 0;
			image_speed = 1;
			obj_ai_foxy.run_sound=audio_play_sound(snd_foxy_run,0,false);
		}
	}
		//TODO: Add golden freddy
	if (_guard_cam == "2B") {
	    if (_bonnie_cam == "2B") {
	        _new_index = spr_cameras_2b_bonnie1gf0;
	    } else if(_bonnie_cam != "2B") {
	        _new_index = spr_cameras_2b_bonnie0gf0;
	    }
	}	
	 else if (_guard_cam == "7") {
        if (_freddy_cam == "7") {
            _new_index = spr_cameras_7_freddy1chica0;
        } else if (_chica_cam == "7") {
            _new_index = spr_cameras_7_freddy0chica1;
        } else if (_chica_cam != "7" && _freddy_cam != "7") {
            _new_index = spr_cameras_7_freddy0chica0;
        }
    } 
    else if (_guard_cam == "4A") {
        if (_freddy_cam == "4A") {
            _new_index = spr_cameras_4a_freddy1chica0;
        } else if (_chica_cam == "4A") {
            _new_index = spr_cameras_4a_freddy0chica1;
        } else if (_chica_cam != "4A" && _freddy_cam != "4A") {
            _new_index = spr_cameras_4a_freddy0chica0;
        }
    } 
    else if (_guard_cam == "4B") {
        if (_freddy_cam == "4B") {
            _new_index = spr_cameras_4b_freddy1chica0;
        } else if (_chica_cam == "4B") {
            _new_index = spr_cameras_4b_freddy0chica1;
        } else if (_chica_cam != "4B" && _freddy_cam != "4B") {
            _new_index = spr_cameras_4b_freddy0chica0;
        }
    }
		
	// Only update if necessary.
	sprite_index = sprite_index != _new_index ? _new_index : sprite_index;
}





