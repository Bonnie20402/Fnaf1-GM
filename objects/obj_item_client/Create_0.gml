/// @description Insert description here
// You can write your code in this editor

item_cost = 30;
item_cooldown = 10;

//Setup item cvooldown decrease every second.
alarm_set(0,1*game_get_speed(gamespeed_fps));

enum ITEM {
	ITEM_MOREPOWER, // Gains a random amount of power
	ITEM_SWAPLIGHT, // Toggle's a random opponent's light
	ITEM_FORCEFOXYPHASE, // Forces a foxy  next phase in a random opponent
	ITEM_SPAWNGOLDENFREDDY, // Spawns golden freddy forcefully.
	ITEM_CAMERASWAP, // Swaps location of two random cameras.
	ITEM_FORCETABLETDOWN, // Puts the tablet of a random nigntguard down
	ITEM_HIDECURRENTPOWER // Hides the current power of a random nightguard for a random amount of time
	
	}




function on_item_use(_item) {
	
	//power gain
	if(_item ==ITEM.ITEM_MOREPOWER && obj_night.current_power > 0) {
	_power_gain = irandom_range(10,80);
	obj_night.current_power+=_power_gain;
	obj_notification_client.add_notification("You recieved " + string(_power_gain / 10) + "% of additional power!");
	}
	
	//Light swap
	if(_item == ITEM.ITEM_SWAPLIGHT && obj_night.current_power>0) { 
		_x = irandom(1) == 1 ? obj_hitbox_leftlight.on_leftlight_press() : obj_hitbox_rightlight.on_rightlight_press();
		obj_notification_client.add_notification("A light has been swapped!");
	}
	
	// Force foxy phase (Won't work if guard is looking at FOXY or foxy is already out)
	
	if(_item == ITEM.ITEM_FORCEFOXYPHASE && obj_night.current_power > 0) {
		
		if(scr_camera_is_camera_up() && obj_gameplaycontroller_client.gameplay.current_camera != "1C" || !scr_camera_is_camera_up()) {
			_time = random_range(1,17.5) / 2;
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
	
	if(_item == ITEM.ITEM_SPAWNGOLDENFREDDY && obj_night.current_power > 0) {
		obj_ai_goldenfreddy.phase = 1;
		obj_ai_goldenfreddy.phase = 1;on_phase_update();
	}
	
	
	if(_item == ITEM.ITEM_CAMERASWAP ) {
		_cameras = ["1A","1B","1C","2A","2B","5","3","6"];
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
		
		obj_notification_client.add_notification(_camera_from + " camera swapped with camera " + _camera_to);
		
		}
	}
}

