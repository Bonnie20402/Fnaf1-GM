/// @description Insert description here
// You can write your code in this editor
enum MENU {
	PLAY,
	CONNECT,
	SETTINGS_TOGGLE,
	SETTINGS_USERNAME,
	SETTINGS_MUTE_FAN,
	SETTINGS_VOLUME,
	SETTINGS_CHANGE,
	QUIT
}

powerup_countdown = 0;
powerup_active = false;
sequence = "";
function test_powerup(_sec) {
	powerup_countdown = _sec;
	powerup_active = true;
	alarm_set(3,1*game_get_speed(gamespeed_fps));
	sequence = layer_sequence_create(layer,room_width/2,room_height/2,seq_test);
	layer_sequence_headpos(sequence,0)
	layer_sequence_xscale(sequence,0.3);
	layer_sequence_yscale(sequence,0.3);
	layer_sequence_speedscale(sequence,1/_sec) 
	layer_sequence_play(sequence);
}
freddy_weird_time = 2;
freddy_normal_time = 0.3;

alarm_set(0,freddy_weird_time*game_get_speed(gamespeed_fps));
alarm_set(1,freddy_normal_time*game_get_speed(gamespeed_fps));


options = false;
options_lock = false;


on_button_click = function(_button) {
	if(_button == MENU.PLAY) {
		if(obj_fnafguard_client.client_state == CLIENTSTATE.OFFLINE) {
			audio_play_sound(snd_error,0,false);
			obj_notification_client.add_notification("You must connect first!");
			return;
		}
		if(obj_lobby_client.in_lobby == false) obj_input_client.run_input_lobby();
		else room_goto(rm_lobby);
	}
	else if (_button == MENU.QUIT) {
		obj_fnafguard_client.on_client_disconnect();
		game_end(0);
	} 
	else if(_button == MENU.CONNECT) {
		if(obj_fnafguard_client.client_state == CLIENTSTATE.OFFLINE) {
			obj_input_client.run_input_ip();
		}
		else {
			obj_fnafguard_client.on_client_disconnect();
		}
	}
	else if(_button == MENU.SETTINGS_TOGGLE) {
		self.options = !self.options;
	}
	else if(_button == MENU.SETTINGS_MUTE_FAN) {
		global.mute_fan = !global.mute_fan;
		obj_io_client.save();
	}
	else if(_button == MENU.SETTINGS_USERNAME) {
		obj_input_client.run_input_username();
	}
	
	
}