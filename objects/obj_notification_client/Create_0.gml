/// @description Insert description here
// You can write your code in this editor

current_alpha = 1;
notification_effect_delay = 0.1;
text = "Notification text";
notification_queue = array_create(0,0);
busy = false;


add_notification = function(_text) {
	if(array_contains(notification_queue,_text))return;
	array_push(notification_queue,_text);
	if(!busy) on_notification_start();
}



decode_and_add_notification = function(_messagetype,_message) {
	var _object = json_parse(_message);
	if(_messagetype == FNAFMESSAGE_FROM_SERVER.CLASS_GUARDDEATH) {
		add_notification("The guard " + _object.death_username + " has been killed at " + string(_object.death_hours) + " AM"); 
	}  
	if(_messagetype == FNAFMESSAGE_FROM_SERVER.CLASS_LOBBYJOIN) {
		add_notification("[" +string(_object.lobbyjoin_clientid)+"] " + _object.lobbyjoin_username + " joined the lobby");
	}
	if(_messagetype == FNAFMESSAGE_FROM_SERVER.CLASS_LOBBYQUIT) {
		add_notification("[" +string(_object.lobbyquit_clientid)+"] " + _object.lobbyquit_username + " left the lobby");
	}
}


on_notification_start = function() {
	if(array_length(notification_queue) == 0) return;
	alarm_set(0,3*game_get_speed(gamespeed_fps));
	current_alpha = 1;
	text = notification_queue[0];
	busy = true;
}
on_notification_finish = function() {
	array_delete(notification_queue,0,1);
	busy = false;
	on_notification_start();
	
}














