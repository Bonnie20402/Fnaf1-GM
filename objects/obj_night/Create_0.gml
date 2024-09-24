/// @description Night,  Hour and  Power System
// You can write your code in this editor

gui_time_x = 1100;
gui_time_y = 650;

gui_x = 100;
gui_y = 650;


night_seed = randomize();
run_night = false;

//The time passes by advancing the hour number by 1 every 90 seconds.
//This makes an in-game minute 1.5 seconds, an in-game hour 1 minute and 30 seconds, 
//and one night 9 minutes.
night_timer = new NightTimerModel();
power_left = new PowerModel();

//The current night.
current_night = 0;

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
			obj_ai_bonnie.animatronic_set_ai_level(12);
			obj_ai_chica.animatronic_set_ai_level(12);
			obj_ai_foxy.animatronic_set_ai_level(10);
			obj_ai_goldenfreddy.use_ai = true;
			obj_ai_goldenfreddy.agressive_mode = true;
			break;
		default:
			obj_ai_freddy.animatronic_set_ai_level(obj_lobby_client.freddy_ai);
			obj_ai_bonnie.animatronic_set_ai_level(obj_lobby_client.bonnie_ai);
			obj_ai_chica.animatronic_set_ai_level(obj_lobby_client.chica_ai);
			obj_ai_foxy.animatronic_set_ai_level(obj_lobby_client.foxy_ai);
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
	obj_core.gameplay.current_hours = current_hours;
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

function on_night_start(_night) {
	if(room != rm_office) {
		show_message("Oops!\nThe night has been started outside of the office.\nThe game is going to close.");
		game_end(1);
	}
	run_night = true;
	// Re-init office variables
	obj_core.gameplay.office.close_left_door()
	obj_core.gameplay.office.close_right_door()
	obj_core.gameplay.office.close_left_light()
	obj_core.gameplay.office.close_right_light()
	obj_core.can_scroll = true;
	obj_core.jumpscared = false;
	obj_core.gameplay.camera.force_down();
	// Re-init night variables
	current_night = _night;
	current_power = 999;
	current_power_usage = 1;
	
	//Setup animatronic AI
	update_animatronic_ai();
	enable_animatronic_ai();
	//1987
	if(obj_ai_freddy.ai_level = 1 && obj_ai_bonnie.ai_level == 9 && obj_ai_chica.ai_level == 8 && obj_ai_foxy.ai_level == 7) {
		obj_ai_goldenfreddy.on_animatronic_jumpscare();
		return;
	}
	// Current power alarm
	alarm_set(0,1*game_get_speed(gamespeed_fps));
	//Time alarm
	alarm_set(1,90*game_get_speed(gamespeed_fps));
	//Extra power drain
	alarm_set(2,power_extra_drain_rate*game_get_speed(gamespeed_fps));
	// The message
	obj_notification_client.add_notification(string(current_hours) + " AM\n Survive the night 'till 6 AM")
}

function enable_animatronic_ai() {
	obj_ai_freddy.use_ai = true;
	obj_ai_bonnie.use_ai = true;
	obj_ai_chica.use_ai = true;
	obj_ai_foxy.use_ai = true;
	//Golden freddy is handled on update animatronic ai
}

function disable_animatronic_ai() {
	obj_ai_freddy.use_ai = false;
	obj_ai_bonnie.use_ai = false;
	obj_ai_chica.use_ai = false;
	obj_ai_foxy.use_ai = false;
}
function on_night_finish() {
	run_night = false;
	room_goto(rm_6_am);
}
#endregion








