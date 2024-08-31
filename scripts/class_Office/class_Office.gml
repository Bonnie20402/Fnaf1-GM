// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

/*
    The OfficeModel constructor contains all of the office logic such as Doors, lights, power system and if the screen is scrollable or not.
    Should contain methods to open the door or light, to close the door, etc. And those methods are the ones that should be called.
*/

enum OFFICESTATE {
    POWERUP,
    POWERDOWN,
    JUMPSCARED
}
function OfficeModel() constructor {
    state = OFFICESTATE.POWERUP
    left_door = false;
	left_door_blocked = false;
	right_door = false;
	right_door_blocked = false;
	left_light_scare = false;
	right_light_scare = false;
	light_flickering = false;
	left_light = false;
	right_light = false;
	light_flickering = false;
	can_scroll = false;

    // X position of the view
	scroll_view = 0;

    function on_office_jumpscare() {	
		state = OFFICESTATE.JUMPSCARED
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

	function on_office_powerout() {
		state = OFFICESTATE.POWERDOWN;
		audio_stop_sound(snd_fan);
		instance_destroy(obj_office_ventilator_gif);
		instance_destroy(obj_office_leftpanel);
		instance_destroy(obj_office_rightpanel);
		// Play door open sound if doors are closed.
		if(left_door || 
		right_door) audio_play_sound(snd_door,0,false);
		
		//Close all doors and turn off the lights.
		close_left_door()
		close_right_door()
		close_left_light()
		close_right_light()


		obj_night.update_power_usage();
		scr_camera_force_down();
		audio_stop_sound(snd_light);
		audio_play_sound(snd_power_out,0,false);
	}


    function open_left_door() {
        self.left_door = true;
    }
    function close_left_door() {
        self.left_door = false;
    }
    function open_right_door() {
        self.right_door = true;
    }
    function close_right_door() {
        self.right_door = false;
    }

    function open_right_light() {
        self.right_light = true;
    }
    function close_right_light() {
        self.right_light = false;
    }
    function close_left_light() {
        self.left_light = false;
    }
    function open_left_light() {
        self.left_light = true;
    }
	function toggle_left_door() {
		if(obj_ai_bonnie.current_camera == "Attack") {
			audio_play_sound(snd_error,0,false);
			return;
		}
		audio_play_sound(snd_door,0,false);
		self.left_door = !self.left_door;
	}  
	function toggle_left_light() {
		//if you have been fucked by bonnie
		if(obj_ai_bonnie.current_camera == "Attack") {
			audio_play_sound(snd_error,0,false);
			return;
		}
		if(left_light 
			&& obj_ai_bonnie.current_camera == "LeftWindow"
			 && left_light_scare) {
				left_light_scare = true;
				audio_play_sound(snd_window_scare,0,false);
		}

		self.left_light = !self.left_light;
		close_right_light()
		obj_night.update_power_usage();
	}  
	function toggle_right_door() {
		if(obj_ai_chica.current_camera == "Attack") {
			audio_play_sound(snd_error,0,false);
			return;
		}
		audio_play_sound(snd_door,0,false);
		self.right_door = !self.right_door;
	}  
	function toggle_right_light() {
		//pov:  you have been fucked by chica
		if(obj_ai_chica.current_camera == "Attack") {
			audio_play_sound(snd_error,0,false);
			return;
		}
		if(right_light 
			&& obj_ai_chica.current_camera == "RightWindow"
			 && right_light_scare) {
				right_light_scare = true;
				audio_play_sound(snd_window_scare,0,false);
		}

		self.right_light = !self.right_light;
		close_left_light()
		obj_night.update_power_usage();
	}  
}