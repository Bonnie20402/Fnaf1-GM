/// @description Declare Global Protocol Variables and Client-specific variables.
// You can write your code in this editor
global.CLIENT_DEBUG = true;
global.IS_CLIENT = true;
global.CLIENT_PROTOCOL_VERSION = 1;
global.SERVER_GAME_PROTOCOL = "ERICO E LARA LINDOS";


username = "Player";
server_connection = -1;
client_os = os_type;
client_id = -1;

keep_alive_timestamp = current_time;
timeout = 6000;

//Server-side client variables
left_door = false;
right_door = false;
left_light = false;
right_light = false;
camera_up = false;
current_camera = "N/A"
current_hours = 12;
power_left = 100;
power_usage = 1;
jumpscared = false;
target_client_id = 0;

//Client-side client variables.
guards_alive = 0;







alarm_set(0,0.1*game_get_speed(gamespeed_fps));

client_state = CLIENTSTATE.OFFLINE;




#region General actions (connect,disconnect)
connect_client = function() {
	server_connection = network_create_socket(network_socket_tcp);
	server_connection = network_connect(server_connection,"localhost",1987);
	show_debug_message("Connecting to server...");
}

disconnect_client = function() {
	network_destroy(server_connection);
	server_connection = -1;
}

#endregion


#region Events prefix: on_

/**
 * Called when the client connects, after knowing that is it up-to-date.
 */
on_client_connect = function() {
	show_debug_message("Connected to server")
	show_debug_message("Waiting the server's version...");
}


/**
 * Called when the client disconnects.
 */
on_client_disconnect = function() {
	username = "Player";
	server_connection = -1;
	client_os = os_type;
	client_id = -1;
	client_state = CLIENTSTATE.OFFLINE;
	//Server-side client variables
	left_door = false;
	right_door = false;
	left_light = false;
	right_light = false;
	camera_up = false;
	current_camera = "N/A"
	current_hours = 12;
	power_left = 100;
	power_usage = 1;
	jumpscared = false;

	//Client-side client variables.
	guards_alive = 0;

}


on_client_out_of_date = function() {
	show_debug_message("This client is out of date!");
	disconnect_client();
	
	server_connection = -2;
}

on_client_clientid_recieved = function() {
	show_debug_message("Recieved my client id: " + string(obj_client.client_id));
}

on_client_up_to_date = function() {
	show_debug_message("Client is up to date. Sending platform...");
	obj_client.send_client_platform();
	show_debug_message("Init complete. - Requesting  my client id...");
	obj_client.request_client_clientid();
	
}


on_server_state_update = function() {
	show_debug_message("Server state updated!")
	
}

/**
 * Should be called when there client state updates. ASSIGN THE UPDATE INTO THE VARIABLE BEFORE CALLING THIS!
 * Ex: entering a room, jumpscared, night win...
 */
on_state_update = function() {
	show_debug_message("Client state updated.")
}

#endregion
#region Data recieved from server
on_server_message_recieved = function(_message_type,_message) {
	#region DEBUG
	if(global.CLIENT_DEBUG) {
	show_debug_message("Message type " + string(_message_type) +
	" recieved from server"
	+ ":" + string(_message));
	}
	#endregion
	#region Version check
	if(_message_type == FNAFMESSAGE_FROM_SERVER.VERSIONCHECK) {
		show_debug_message("Recieved version from server!")
			//Check if the version between server and client is the same
			var _version = _message;
			if(global.CLIENT_PROTOCOL_VERSION == _version) obj_client.on_client_up_to_date();
			else obj_client.on_client_out_of_date();
	}
	
	#endregion
	#region Client id
	if(_message_type == FNAFMESSAGE_FROM_SERVER.UPDATE_CLIENT_ID) {
		var _id = _message;
		obj_client.client_id = _id;
		obj_client.on_client_clientid_recieved();
	}
		
	#region Keep-alive
	if(_message_type == FNAFMESSAGE_FROM_SERVER.KEEP_ALIVE) {
		if(_message == 1) keep_alive_timestamp = current_time;
	}
	#endregion
	#endregion
	
	#region Got ass attacked
	if(_message_type == FNAFMESSAGE_FROM_SERVER.NEW_FNAF_ATTACK) {
		if(_message == FNAFATTACK.SPAWN_GOLDEN_FREDDY) {
			obj_ai_goldenfreddy.on_goldenfreddy_appear();
		}
	}
	#endregion
	
	#region Alive guards update
	if(_message_type == FNAFMESSAGE_FROM_SERVER.UPDATE_ALIVE_GUARDS) {
		obj_client.guards_alive = _message;
	}
	
}
#endregion


#region Send data to server prefix: send_client_...

send_client_state = function() {
	buffer_fnaf_create_and_send(server_connection,FNAFMESSAGE_FROM_CLIENT.SEND_CLIENT_STATE,obj_client.client_state);
}

send_client_platform = function () {
	buffer_fnaf_create_and_send(server_connection,FNAFMESSAGE_FROM_CLIENT.SEND_CLIENT_OS,obj_client.client_os)
}

send_leftdoor_state = function() {
	buffer_fnaf_create_and_send(server_connection,FNAFMESSAGE_FROM_CLIENT.LEFTDOOR_UPDATE,obj_office.left_door);
}

send_rightdoor_state = function() {
	buffer_fnaf_create_and_send(server_connection,FNAFMESSAGE_FROM_CLIENT.RIGHTDOOR_UPDATE,obj_office.right_door);
}

send_leftlight_update = function() {
	buffer_fnaf_create_and_send(server_connection,FNAFMESSAGE_FROM_CLIENT.LEFTLIGHT_UPDATE,obj_office.left_light);
}
send_rightlight_update = function() {
	buffer_fnaf_create_and_send(server_connection,FNAFMESSAGE_FROM_CLIENT.RIGHTLIGHT_UPDATE,obj_office.right_light);
}

send_cameraup_state = function() {
	buffer_fnaf_create_and_send(server_connection,FNAFMESSAGE_FROM_CLIENT.CAMERAUP_UPDATE,obj_office.camera_up);
}

send_currentcamera_update = function() {
	buffer_fnaf_create_and_send(server_connection,FNAFMESSAGE_FROM_CLIENT.CURRENTCAMERA_UPDATE,obj_office.current_camera);
}

send_powerleft_update = function() {
	buffer_fnaf_create_and_send(server_connection,FNAFMESSAGE_FROM_CLIENT.POWERLEFT_UPDATE,round(obj_night.current_power/10));
}

send_powerusage_update = function() {
	buffer_fnaf_create_and_send(server_connection,FNAFMESSAGE_FROM_CLIENT.POWERUSAGE_UPDATE,obj.night.current_power_usage);
}

send_night_time_update = function() {
	buffer_fnaf_create_and_send(server_connection,FNAFMESSAGE_FROM_CLIENT.NIGHT_TIME_UPDATE,obj_night.current_hours);
}



send_powerout = function() {
	buffer_fnaf_create_and_send(server_connection,FNAFMESSAGE_FROM_CLIENT.POWEROUT,1);
}

send_night_lose = function() {
	buffer_fnaf_create_and_send(server_connection,FNAFMESSAGE_FROM_CLIENT.NIGHT_LOSE,1);
}
send_night_win = function () {
	buffer_fnaf_create_and_send(server_connection,FNAFMESSAGE_FROM_CLIENT.NIGHT_WIN,1)
}




#endregion

#region Reqeust data from server prefix: request_client_...
request_client_clientid = function() {
	buffer_fnaf_create_and_send(server_connection,FNAFMESSAGE_FROM_CLIENT.REQUEST_CLIENT_ID,1);
}
#endregion

#region Boot
if(global.IS_CLIENT) {
	if(instance_number(obj_client) == 1) {
		connect_client();
	}
	else {
		disconnect_client();
		on_client_disconnect();
		instance_destroy(self);
	}
}
#endregion

#region Util

/// to_String()
/// Returns a string containing the values of the specified variables.

to_string = function(){
    var _result = "";
    // Player variables
    _result += "username = " + string(username) + ";\n";
    _result += "client_state = " + string(client_state) + ";\n";
    _result += "client_id = " + string(client_id) + ";\n";
	_result += "target_id = " + string(target_client_id) + ";\n";
    // Server-side client variables
    _result += "left_door = " + string(left_door) + ";\n";
    _result += "right_door = " + string(right_door) + ";\n";
    _result += "left_light = " + string(left_light) + ";\n";
    _result += "right_light = " + string(right_light) + ";\n";
    _result += "camera_up = " + string(camera_up) + ";\n";
    _result += "current_camera = " + string(current_camera) + ";\n";
    _result += "current_hours = " + string(current_hours) + ";\n";
    _result += "power_left = " + string(power_left) + ";\n";
    _result += "power_usage = " + string(power_usage) + ";\n";
    _result += "jumpscared = " + string(jumpscared) + ";\n";
    
    return _result;
}
#endregion

