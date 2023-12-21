function scr_on_camera_open_start(){
	audio_sound_gain(snd_fan,0.3,250);
	audio_play_sound(snd_camera_up,0,false);
	obj_ai_goldenfreddy.scr_on_camera_open_start();
	if(!obj_fnafguard_client.is_spectating) {
		obj_fnafguard_client.send_cameraup_state();
		obj_fnafguard_client.send_currentcamera_update();
	}
}

function scr_on_camera_open_finish() {
	obj_night.update_power_usage();
	audio_play_sound(snd_blop,0,false);
	view_visible[0] = false;
	view_visible[1] = true;
	obj_office.can_scroll = false;
	obj_camera_hud._camera_change_effect_frame = 0;
	if(obj_night.current_power == 0) scr_camera_force_down();
	
}

function scr_play_camera_disable_sound() {
	var _sound = irandom(2);
	switch(_sound) {
		case 0:
			audio_play_sound(snd_camera_disable0,0,false,1);
			break;
		case 1:
			audio_play_sound(snd_camera_disable1,0,false,1);
			break;
		case 2:
			audio_play_sound(snd_camera_disable2,0,false,1);
			break;
	}
}
function scr_stop_camera_disable_sound() {
	audio_stop_sound(snd_camera_disable0);
	audio_stop_sound(snd_camera_disable1);
	audio_stop_sound(snd_camera_disable2);
}

function scr_on_camera_close_start() {
	view_visible[0] = true;
	view_visible[1] = false;
	obj_fnafguard_client.send_cameraup_state();
	obj_office.can_scroll = true;
	audio_sound_gain(snd_fan,0.8,250);
	audio_play_sound(snd_camera_down,0,false);
	audio_stop_sound(snd_camera_up);
	scr_stop_camera_disable_sound();
	if(obj_ai_bonnie.current_camera == "Attack")  {
		obj_ai_bonnie.current_camera = "AttackSuccess";
		obj_ai_bonnie.on_animatronic_move();
		obj_ai_bonnie.on_animatronic_attack();
	}
	else if(obj_ai_chica.current_camera == "Attack") {
		obj_ai_chica.current_camera = "AttackSuccess";
		obj_ai_chica.on_animatronic_move();
		obj_ai_chica.on_animatronic_attack();
	}

	//Foxy has a countdown time that's supposed to prevent him from moving until about 1-17.5 seconds after the monitor is put down
	if(obj_ai_foxy.current_camera != "2A")obj_ai_foxy.camera_down_time = random_range(1,17.5);
}


function scr_on_camera_close_finish() {
	obj_night.update_power_usage();
	
}


function scr_on_camera_change_start() {
	obj_camera_hud._camera_change_effect_frame = 0;
	obj_camera_current_spr.update_current_camera_sprite();
	obj_ai_goldenfreddy.scr_on_camera_change_start();
	audio_play_sound(snd_blop,0,0);
	if(!obj_fnafguard_client.is_spectating)obj_fnafguard_client.send_currentcamera_update();
	
}


function on_camera_change_finish() {
	
}

function on_camera_ui_update() {
}

function scr_camera_force_down() {
	//prevent infinite loop
	if(obj_hitbox_camera.camera_lock) return;
	
	if(obj_office.camera_up) obj_office.camera_up = false;
	if(!obj_hitbox_camera.camera_lock)obj_hitbox_camera.camera_lock = true;
}

function scr_camera_force_up() {
	//prevent infinite loop
	if(obj_hitbox_camera.camera_lock) return;
	
	if(!obj_office.camera_up) obj_office.camera_up = true;
	if(!obj_hitbox_camera.camera_lock)obj_hitbox_camera.camera_lock = true;
}

function scr_camera_is_camera_up () {
	return obj_office.camera_up && !obj_hitbox_camera.camera_lock;
}

function scr_camera_setup() {
	camera_button_1a.set_camera_button("1A");
	camera_button_1a.set_camera_text("Show Stage");
	camera_button_1b.set_camera_button("1B");
	camera_button_1b.set_camera_text("Dinning Area");
	camera_button_1c.set_camera_button("1C");
	camera_button_1c.set_camera_text("Mewo's Cove");
	camera_button_2a.set_camera_button("2A");
	camera_button_2a.set_camera_text("West Hall");
	camera_button_2b.set_camera_button("2B");
	camera_button_2b.set_camera_text("West Hall Corner");
	camera_button_4a.set_camera_button("4A");
	camera_button_4a.set_camera_text("East Hall");
	camera_button_4b.set_camera_button("4B");
	camera_button_4b.set_camera_text("East Hall Corner");
	camera_button_3.set_camera_button("3");
	camera_button_3.set_camera_text("Supply Closet");
	camera_button_5.set_camera_button("5");
	camera_button_5.set_camera_text("Backstage");
	camera_button_7.set_camera_button("7");
	camera_button_7.set_camera_text("Restroom");
	//TODO: Update this value 
	camera_button_6.set_camera_button("6");
	camera_button_6.set_camera_text("Sulartzo's Kitchen");
	
	obj_camera_string.set_camera_current_string("Show Stage");
	obj_camera_current_spr.update_current_camera_sprite();
}

/*
	DEBUG FUNCTIONS
						*/
						
///@desc DEPRECTATED
function scr_toggle_camera_buttons_visibility() {
	for( var _i =0; _i < instance_number(obj_camera_button);_i++ )  {
		var _inst = instance_find(obj_camera_button,_i);
		_inst.visible = !_inst.visible;
	}
}

function scr_disable_camera_buttons() {
		for( var _i =0; _i < instance_number(obj_camera_button);_i++ )  {
		var _inst = instance_find(obj_camera_button,_i);
		_inst.active = false;
	}
}