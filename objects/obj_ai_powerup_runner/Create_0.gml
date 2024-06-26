/// @description Insert description here
// You can write your code in this editor
enum ITEM {
	ITEM_ELETRICITYBILL=1, // Gains  or takes a random amount of power
	ITEM_FORCEFOXYPHASE=2, // Forces a foxy  next phase in a random opponent
	ITEM_CAMERASWAP=3, // Swaps location of two random cameras.
	ITEM_RESETAI=4, // Resets a animatronic AI (Like respawns a animatronic)
	ITEM_ANIMATRONICOVERLOAD=5, // Adds or takes away a random value of the robot AI. Hardcaps to 20 and 0.
	ITEM_LAST=6 // Pointer to finish enum.
	}




function run_powerup(_item) {
	
	//power gain
	if(_item ==ITEM.ITEM_ELETRICITYBILL && obj_night.current_power > 0) {
		var _power_gain = irandom_range(10,80);
		var _take = irandom(1);
		obj_night.current_power = _take == 1 ? obj_night.current_power-_power_gain : obj_night.current_power+_power_gain;
		if(obj_night.current_power<=0) obj_night.current_power = 1;
		var _verb = _take == 1 ? "lost " : "gained ";
		obj_notification_client.add_notification("You " + _verb + string(_power_gain / 10) + "% of power!");
	}
	
	
	// Force foxy phase (Won't work if guard is looking at FOXY or foxy is already out)
	
	if(_item == ITEM.ITEM_FORCEFOXYPHASE && obj_night.current_power > 0) {
		
		if(scr_camera_is_camera_up() && obj_gameplaycontroller_client.gameplay.current_camera != "1C" || !scr_camera_is_camera_up()) {
			var _time = random_range(1,17.5) / 2;
			//Turn down timer if it's higher than the current one
			if(obj_ai_foxy.camera_down_time > _time) obj_ai_foxy.camera_down_time = _time;
			
			if(obj_ai_foxy.current_camera == "1C_0") {
				obj_ai_foxy.current_camera = "1C_1";
				obj_ai_foxy.on_animatronic_move();
			}
			else if(obj_ai_foxy.current_camera == "1C_1") {
				obj_ai_foxy.current_camera = "1C_2";
				obj_ai_foxy.on_animatronic_move();
			}
			else if(obj_ai_foxy.current_camera == "1C_2") {
				obj_ai_foxy.current_camera = "2A";
				obj_ai_foxy.on_animatronic_move();
			}
		}
		obj_notification_client.add_notification("A Foxy phase has been forced!");
	}
	
	
	
	if(_item == ITEM.ITEM_CAMERASWAP ) {
		var _cameras = ["1A","1B","1C","2A","2B","5","3","6"];
		if(!scr_camera_is_camera_up()) {
			do {
				_camera_from = _cameras[irandom(array_length(_cameras)-1)];
				_camera_to = _cameras[irandom(array_length(_cameras)-1)];
		}until(_camera_from != _camera_to);
		
		with(obj_camera_button) {
			if(self.camera_button == other._camera_from) {
				other._from_name = self.camera_text;
				
			}
			else if(self.camera_button == other._camera_to) {
				other._to_name = self.camera_text;
			}
			
		}
		with(obj_camera_button) {
			if(self.camera_button == other._camera_to) {
			self.camera_button = other._camera_from;
			self.camera_text = other._from_name;
			}
	
		else if(self.camera_button == other._camera_from) {
			self.camera_button = other._camera_to;
			self.camera_text = other._to_name;
			}
		}
		
		obj_notification_client.add_notification("Camera " + _camera_from + " swapped with camera " + _camera_to+".");
		
		}
	}
	
	if(_item == ITEM.ITEM_RESETAI) {
		var _animatronic = irandom(3);
		if(_animatronic == 0) {
			obj_ai_freddy.current_camera = "1A";
			obj_ai_freddy.on_animatronic_move();
			obj_notification_client.add_notification("Freddy has been reset back to 1A!");
		}
		if(_animatronic == 1) {
			obj_ai_bonnie.current_camera = obj_ai_freddy.current_camera == "1A" ? "1A" : "1B";
			
			obj_ai_bonnie.on_animatronic_move();
			obj_notification_client.add_notification("Bonnie has been reset back to " +obj_ai_bonnie.current_camera + "!");
		}
		if(_animatronic == 2) {
			obj_ai_chica.current_camera = obj_ai_freddy.current_camera == "1A" ? "1A" : "1B";
			obj_ai_chica.on_animatronic_move();
			obj_notification_client.add_notification("Chica has been reset back to " +obj_ai_chica.current_camera + "!");
		}
		if(_animatronic == 3) {
			obj_ai_foxy.current_camera = "1C_0";
			obj_ai_foxy.on_animatronic_move();
			obj_notification_client.add_notification("Foxy has been reset back to phase 0!");
		}
	}
	
	if(_item == ITEM.ITEM_ANIMATRONICOVERLOAD) {
		var _robot = irandom(3);
		var _amount = 1 + irandom(5);
		var _add = irandom(1);
		if(_robot == 0) {
			if(_add) {
				obj_ai_freddy.ai_level+=_amount;
				if(obj_ai_freddy.ai_level>20) obj_ai_freddy.ai_level=20;
				obj_notification_client.add_notification("The AI level of Freddy has been raised to " + string(obj_ai_freddy.ai_level));
			}
			else {
				obj_ai_freddy.ai_level-=_amount;
				if(obj_ai_freddy.ai_level<0) obj_ai_freddy.ai_level=0;
				obj_notification_client.add_notification("The AI level of Freddy has been reduced to " + string(obj_ai_freddy.ai_level));
			}
		}
		if(_robot == 1) {
			if(_add) {
				obj_ai_bonnie.ai_level+=_amount;
				if(obj_ai_bonnie.ai_level>20) obj_ai_bonnie.ai_level=20;
				obj_notification_client.add_notification("The AI level of Bonnie has been raised to " + string(obj_ai_bonnie.ai_level));
			}
			else {
				obj_ai_bonnie.ai_level-=_amount;
				if(obj_ai_bonnie.ai_level<0) obj_ai_bonnie.ai_level=0;
				obj_notification_client.add_notification("The AI level of Bonnie has been reduced to " + string(obj_ai_bonnie.ai_level));
			}
		}
		if(_robot == 2) {
		    if(_add) {
		        obj_ai_chica.ai_level+=_amount;
		        if(obj_ai_chica.ai_level>20) obj_ai_chica.ai_level=20;
		        obj_notification_client.add_notification("The AI level of Chica has been raised to " + string(obj_ai_chica.ai_level));
		    }
		    else {
		        obj_ai_chica.ai_level-=_amount;
		        if(obj_ai_chica.ai_level<0) obj_ai_chica.ai_level=0;
		        obj_notification_client.add_notification("The AI level of Chica has been reduced to " + string(obj_ai_chica.ai_level));
		    }
		}
		if(_robot == 3) {
			if(_add) {
				obj_ai_foxy.ai_level+=_amount;
				if(obj_ai_foxy.ai_level>20) obj_ai_foxy.ai_level=20;
				obj_notification_client.add_notification("The AI level of Foxy has been raised to " + string(obj_ai_foxy.ai_level));
			}
			else {
				obj_ai_foxy.ai_level-=_amount;
				if(obj_ai_foxy.ai_level<0) obj_ai_foxy.ai_level=0;
				obj_notification_client.add_notification("The AI level of Foxy has been reduced to " + string(obj_ai_foxy.ai_level));
			} 
		}
	}
}