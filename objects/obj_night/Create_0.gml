/// @description Night,  Hour and  Power System
// You can write your code in this editor

gui_x = 50;
gui_y = 650;

gui_time_x = 1030;
gui_time_y = 30;


night_seed = randomize();
run_night = false;

//The time passes by advancing the hour number by 1 every 90 seconds.
//This makes an in-game minute 1.5 seconds, an in-game hour 1 minute and 30 seconds, 
//and one night 9 minutes.
current_hours = 12;

//The current night.
current_night = 1;

//The current power left.
current_power = 999;


// - 0.1% every power_extra_drain_rate seconds.
// 0 to disable. (Night 1)
power_extra_drain_rate = 0;

current_power_usage = 1;




// NOTE: Call when door is toggled, camera is open, closed, light is  toggled.
function update_power_usage() {
	if(!run_night) return;
	current_power_usage = 1 + obj_office.left_door + obj_office.right_door + scr_camera_is_camera_up() + obj_office.left_light + obj_office.right_light;
	on_power_usage_update();
}

//The power drains faster as the nights go on. 
//An additional 0.1% power drain is present on all nights except Night 1,
//at smaller increments depending on the night.
function update_power_extra_drain_rate() {
	if(current_night == 1) power_extra_drain_rate = 0;
	else if(current_night == 2) power_extra_drain_rate = 6;
	else if (current_night == 3) power_extra_drain_rate = 5;
	else if (current_night == 4) power_extra_drain_rate = 4;
	else if (current_night >= 5) power_extra_drain_rate = 3;
}

function update_animatronic_ai() {
	switch(current_night) {
		case 1:
			obj_ai_freddy.animatronic_set_ai_level(0);
			obj_ai_bonnie.animatronic_set_ai_level(0);
			obj_ai_chica.animatronic_set_ai_level(0);
			obj_ai_foxy.animatronic_set_ai_level(0);
			obj_ai_goldenfreddy.use_ai = false;
			obj_ai_goldenfreddy.agressive_mode = false;
			break;
		case 2:
			obj_ai_freddy.animatronic_set_ai_level(0);
			obj_ai_bonnie.animatronic_set_ai_level(3);
			obj_ai_chica.animatronic_set_ai_level(1);
			obj_ai_foxy.animatronic_set_ai_level(1);
			obj_ai_goldenfreddy.use_ai = true;
			obj_ai_goldenfreddy.agressive_mode = false;
			break;
		case 3:
			obj_ai_freddy.animatronic_set_ai_level(1);
			obj_ai_bonnie.animatronic_set_ai_level(0);
			obj_ai_chica.animatronic_set_ai_level(5);
			obj_ai_foxy.animatronic_set_ai_level(2);
			obj_ai_goldenfreddy.use_ai = true;
			obj_ai_goldenfreddy.agressive_mode = false;
			break;
		case 4:
			// (Freddy's activity is randomized between 1 or 2)
			obj_ai_freddy.animatronic_set_ai_level(irandom_range(1,2));
			obj_ai_bonnie.animatronic_set_ai_level(2);
			obj_ai_chica.animatronic_set_ai_level(4);
			obj_ai_foxy.animatronic_set_ai_level(6);
			obj_ai_goldenfreddy.use_ai = true;
			obj_ai_goldenfreddy.agressive_mode = true;
			break;
		case 5:
			obj_ai_freddy.animatronic_set_ai_level(3);
			obj_ai_bonnie.animatronic_set_ai_level(5);
			obj_ai_chica.animatronic_set_ai_level(7);
			obj_ai_foxy.animatronic_set_ai_level(5);
			obj_ai_goldenfreddy.use_ai = true;
			obj_ai_goldenfreddy.agressive_mode = true;
			break;
		case 6:
			obj_ai_freddy.animatronic_set_ai_level(4);
			obj_ai_bonnie.animatronic_set_ai_level(10);
			obj_ai_chica.animatronic_set_ai_level(12);
			obj_ai_foxy.animatronic_set_ai_level(6);
			obj_ai_goldenfreddy.use_ai = true;
			obj_ai_goldenfreddy.agressive_mode = true;
			break;
	}
}


#region Events
/*
Bonnie's activity level is raised by 1 at 2 AM, 3 AM, and 4 AM. 
Chica and Foxy's activity levels are raised by 1 at 3 AM and 4 AM.
This explains why those three activate when set to 0.
It also explains why Bonnie doesn't become active until about 2 AM on Night 1.
*/
function on_hour_update() {
	if(current_hours == 2) {
		obj_ai_bonnie.animatronic_add_ai_level(1);
	}
	if(current_hours == 3) {
		obj_ai_bonnie.animatronic_add_ai_level(1);
		obj_ai_foxy.animatronic_add_ai_level(1);
		obj_ai_chica.animatronic_add_ai_level(1);
	}
	if(current_hours == 4) {
		obj_ai_bonnie.animatronic_add_ai_level(1);
		obj_ai_foxy.animatronic_add_ai_level(1);
		obj_ai_chica.animatronic_add_ai_level(1);
	}
	
	if(current_hours == 6) {
		on_night_finish();
	}
}

function on_night_start() {
	if(room != rm_office) {
		show_message("Oops!\nThe night has been started outside of the office.\nThe game is going to close.");
		game_end(1);
	}
	// Re-init office variables
	obj_office.left_door = false;
	obj_office.right_door = false;
	obj_office.left_light = false;
	obj_office.right_light = false;
	scr_camera_force_down();
	// Re-init night variables
	current_hours = 12;
	current_power = 999;
	current_power_usage = 1;
	update_power_extra_drain_rate();
	
	//Setup animatronic AI
	update_animatronic_ai();
	// Current power alarm
	alarm_set(0,1*game_get_speed(gamespeed_fps));
	//Time alarm
	alarm_set(1,90*game_get_speed(gamespeed_fps));
	//Extra power drain
	alarm_set(2,power_extra_drain_rate*game_get_speed(gamespeed_fps));
		
}

function on_night_finish() {
	run_night = false;
	if(current_night < 6) current_night++;
	io_save();
	room_goto(rm_6_am);
}

function on_power_update() {
	obj_client.send_powerleft_update();
	if(current_power == 0) {
		on_power_out();
	}
}

function on_power_out() {
	scr_camera_force_down();
	obj_office.on_office_power_out();
	obj_ai_freddy_power_out.on_power_out();
}

function on_power_usage_update() {
	obj_client.send_leftdoor_state();
}

#endregion

#region I/O OPERATIONS
function io_boot() {
	ini_open("config.ini");
	if(!ini_key_exists("night","level") ) {
		ini_write_real("night","level",1);
	}
	ini_close();
	
}
function io_load() {
	ini_open("config.ini");
	current_night = ini_read_real("night","level",1);
	ini_close();
}
function io_save() {
	ini_open("config.ini");
	ini_write_real("night","level",current_night);
	ini_close();
}
#endregion








