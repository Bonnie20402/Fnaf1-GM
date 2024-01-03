/// @description Declare Global Protocol Variables and Client-specific variables.
// You can write your code in this editor
global.CLIENT_DEBUG = true;
global.CLIENT_PROTOCOL_VERSION = 1;
global.SERVER_GAME_PROTOCOL = "ERICO E LARA LINDOS";
out_of_date = false;



//Client-side client variables.
keep_alive_timestamp = current_time;
timeout = 3000 + 15000;
username = "Player";
client_id = -1;
server_connection = -1;
server_socket = -1;
client_state = CLIENTSTATE.OFFLINE;
server_state = SERVERSTATE.OPEN
joining_lobby = "";
is_spectating = false;







alarm_set(0,0.1*game_get_speed(gamespeed_fps));





#region General actions (connect,disconnect)
connect_client = function() {
	disconnect_client();
	server_socket = network_create_socket(network_socket_tcp);
	server_connection = network_connect(server_socket,obj_ipconfig_client.ip,obj_ipconfig_client.port);
	show_debug_message("Connecting to " + obj_ipconfig_client.ip + ":" + string(obj_ipconfig_client.port) + "...");
}

disconnect_client = function() {
	network_destroy(server_socket);
}

#endregion


#region Events prefix: on_

/**
 * Called when the client connects, after knowing that is it up-to-date.
 */
on_client_connect = function() {
	show_debug_message("Connected to server")
}

on_clientstate_update = function() {
	obj_fnafguard_client.send_client_state();
	if(client_state == CLIENTSTATE.OFFLINE) disconnect_client();
}
/**
 * Called when the client disconnects.
 */
on_client_disconnect = function() {
	//Client-side client variables.
	username = "Player";
	client_id = -1;
	server_connection = -1;
	client_state = CLIENTSTATE.OFFLINE;
	in_lobby = false;
	joining_lobby = "";
	actual_lobby = "";
	is_spectating = false;
	on_clientstate_update();
}


on_client_out_of_date = function() {
	obj_fnafguard_client.disconnect_client();
	client_state = CLIENTSTATE.OUT_OF_DATE;
	obj_fnafguard_client.on_clientstate_update();
}

on_client_username_update = function() {
	obj_fnafguard_client.send_client_username();
}
on_client_clientid_recieved = function() {
	show_debug_message("Recieved my client id: " + string(obj_fnafguard_client.client_id));
	client_state = CLIENTSTATE.MAIN_MENU;
	send_client_state();
}

on_client_up_to_date = function() {
	show_debug_message("Client is up to date. Requesting client id...");
	obj_fnafguard_client.request_client_clientid();
}

on_client_joining_lobby_update = function() {
	obj_fnafguard_client.send_lobby_join_request(joining_lobby);
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
			if(global.CLIENT_PROTOCOL_VERSION == _version) obj_fnafguard_client.on_client_up_to_date();
			else obj_fnafguard_client.on_client_out_of_date();
	}
	#region Server shutdown
	if(_message_type == FNAFMESSAGE_FROM_SERVER.SERVER_SHUTDOWN) {
		show_message("UPS!\n The server either crashed or shutted down\nYou just recieved a SERVER_SHUTDOWN packet.");
		
		obj_fnafguard_client.disconnect_client();
		obj_fnafguard_client.on_client_disconnect();
	}
	#endregion
	#endregion
	#region Client id
	if(_message_type == FNAFMESSAGE_FROM_SERVER.UPDATE_CLIENT_ID) {
		var _id = _message;
		obj_fnafguard_client.client_id = _id;
		obj_fnafguard_client.on_client_clientid_recieved();
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
	
	#region Lobby 
	if(_message_type == FNAFMESSAGE_FROM_SERVER.LOBBY_JOIN_RESPONSE) {
		if(_message == LOBBY_JOIN_RESPONSE.ACCEPT) {
			obj_lobby_client.on_lobby_join();
		}
		if(_message == LOBBY_JOIN_RESPONSE.REJECTED) {
			obj_lobby_client.on_lobby_quit();
		}
	}
	#region Lobby usernames list
	if(_message_type == FNAFMESSAGE_FROM_SERVER.LOBBY_SEND_USERNAMES_LIST) {
		obj_lobby_client.usernames_list = _message;
	}
	#endregion
	#region Lobby gamemode
	if(_message_type == FNAFMESSAGE_FROM_SERVER.LOBBY_GAMEMODE_UPDATE) {
		obj_lobby_client.gamemode = _message;
	}
	#endregion
	#region Lobby force goto menu
	if(_message_type == FNAFMESSAGE_FROM_SERVER.LOBBY_FORCE_MENU) {
		room_goto(rm_lobby);
	}
	#endregion
	#region Lobby state update
	if(_message_type == FNAFMESSAGE_FROM_SERVER.LOBBY_STATE_UPDATE) {
		obj_lobby_client.lobby_state = _message;
		obj_lobby_client.on_lobby_state_update();
	}
	#endregion
	#region Lobby hour update
	if(_message_type == FNAFMESSAGE_FROM_SERVER.LOBBY_HOUR_UPDATE) {
		obj_lobby_client.current_hours = _message;
		obj_lobby_client.on_lobby_hours_update();
	}
	#endregion
	#region Lobby master update
	if(_message_type == FNAFMESSAGE_FROM_SERVER.LOBBY_MASTER_UPDATE) {
		obj_lobby_client.lobby_master = _message;
	}
	#endregion
	
	#region Alive guards update
	if(_message_type == FNAFMESSAGE_FROM_SERVER.UPDATE_ALIVE_GUARDS) {
		obj_lobby_client.guards_left = _message;
	}
	#endregion
	#region Lobby timer update
	if(_message_type == FNAFMESSAGE_FROM_SERVER.LOBBY_TIMER_UPDATE) {
		obj_lobby_client.timer = _message;
		obj_lobby_client.on_lobby_timer_update();
	}
	#endregion
	
	#region Lobby hours update
	if(_message_type == FNAFMESSAGE_FROM_SERVER.LOBBY_HOUR_UPDATE){
		obj_lobby_client.current_hours = _message;
		obj_lobby_client.on_lobby_hours_update();
	}
	#region  AI Lobby Update / Cam Update
	if(_message_type == FNAFMESSAGE_FROM_SERVER.LOBBY_BONNIEAI_UPDATE) {
		obj_lobby_client.bonnie_ai = _message;
	}
	if(_message_type == FNAFMESSAGE_FROM_SERVER.LOBBY_FREDDYAI_UPDATE) {
		obj_lobby_client.freddy_ai = _message;
	}
	if(_message_type == FNAFMESSAGE_FROM_SERVER.LOBBY_CHICAAI_UPDATE) {
		obj_lobby_client.chica_ai = _message;
	}
	if(_message_type == FNAFMESSAGE_FROM_SERVER.LOBBY_FOXYAI_UPDATE) {
		obj_lobby_client.foxy_ai = _message;
	}
	if(_message_type == FNAFMESSAGE_FROM_SERVER.LOBBY_BONNIECAM_UPDATE) {
		obj_lobby_client.bonnie_cam = _message;
		obj_lobby_client.on_bonnie_cam_update();
	}
	if(_message_type == FNAFMESSAGE_FROM_SERVER.LOBBY_CHICACAM_UPDATE) {
		obj_lobby_client.chica_cam = _message;
		obj_lobby_client.on_chica_cam_update();
	}
	if(_message_type == FNAFMESSAGE_FROM_SERVER.LOBBY_FREDDYCAM_UPDATE) {
		obj_lobby_client.freddy_cam = _message;
		obj_lobby_client.on_freddy_cam_update();
	}
	if(_message_type == FNAFMESSAGE_FROM_SERVER.LOBBY_FOXYCAM_UPDATE) {
		obj_lobby_client.foxy_cam = _message;
		obj_lobby_client.on_foxy_cam_update();
	}
	
	#endregion
	
	#region Spectating
	if(_message_type == FNAFMESSAGE_FROM_SERVER.SPECTATE_REQUEST_RESPONSE) {
		if(_message == SPECTATERESPONSE.OK) {
			return;
		}
		if(_message == SPECTATERESPONSE.REJECTED) obj_spectate_client.spectating_id = -1;
	}
	if(_message_type == FNAFMESSAGE_FROM_SERVER.SPECATE_UPDATE_FREDDYPOWEROUTPHASE) {
		obj_spectate_client.current_freddy_powerout_phase = _message;
		obj_spectate_client.on_freddy_powerout_update();
	}
	if(_message_type == FNAFMESSAGE_FROM_SERVER.SPECTATE_UPDATE_BONNIECAM) {
		obj_spectate_client.current_bonnie_cam = _message;
		obj_spectate_client.on_bonnie_update();
	}
	if(_message_type == FNAFMESSAGE_FROM_SERVER.SPECTATE_UPDATE_CAMERALOCK) {
		obj_spectate_client.camera_lock = _message;
	}
	if(_message_type == FNAFMESSAGE_FROM_SERVER.SPECTATE_UPDATE_CAMERAUP) {
		obj_spectate_client.camera_up = _message;
		obj_spectate_client.on_cameraup_update();
	}
	if(_message_type == FNAFMESSAGE_FROM_SERVER.SPECTATE_UPDATE_LEFTDOOR) {
		obj_spectate_client.left_door = _message;
		obj_spectate_client.on_door_update();
	}
	if(_message_type == FNAFMESSAGE_FROM_SERVER.SPECTATE_UPDATE_RIGHTDOOR) {
		obj_spectate_client.right_door = _message;
		obj_spectate_client.on_door_update();
	}
	if(_message_type == FNAFMESSAGE_FROM_SERVER.SPECTATE_UPDATE_LEFTLIGHT) {
		obj_spectate_client.left_light = _message;
	}
	if(_message_type == FNAFMESSAGE_FROM_SERVER.SPECTATE_UPDATE_RIGHTLIGHT) {
		obj_spectate_client.right_light = _message;
	}
	if(_message_type == FNAFMESSAGE_FROM_SERVER.SPECTATE_UPDATE_CURRENTCAMERA) {
		obj_spectate_client.current_camera = _message;
		obj_spectate_client.on_currentcamera_update();
	}
	if(_message_type == FNAFMESSAGE_FROM_SERVER.SPECTATE_UPDATE_CHICACAM) {
		obj_spectate_client.current_chica_cam = _message;
		obj_spectate_client.on_chica_update();
	}
	if(_message_type == FNAFMESSAGE_FROM_SERVER.SPECTATE_UPDATE_FOXYCAM) {
		obj_spectate_client.current_foxy_cam = _message;
		obj_spectate_client.on_foxy_update();
	}
	if(_message_type == FNAFMESSAGE_FROM_SERVER.SPECTATE_UPDATE_FREDDYCAM) {
		obj_spectate_client.current_freddy_cam = _message;
		obj_spectate_client.on_freddy_update();
	}
	if(_message_type == FNAFMESSAGE_FROM_SERVER.SPECTATE_UPDATE_NIGHTEND) {
		obj_spectate_client.night_state = _message;
		obj_spectate_client.on_nightstate_update();
	}
	if(_message_type == FNAFMESSAGE_FROM_SERVER.SPECTATE_UPDATE_GOLDENFREDDYSTATE) {
		obj_spectate_client.current_goldenfreddy_state = _message;
		obj_spectate_client.on_goldenfreddy_update();
	}
	if(_message_type == FNAFMESSAGE_FROM_SERVER.SPECTATE_UPDATE_CURRENTHOURS) {
		obj_spectate_client.current_hours = _message;
	}
	if(_message_type == FNAFMESSAGE_FROM_SERVER.SPECTATE_UPDATE_POWERLEFT) {
		obj_spectate_client.power_left = _message;
		obj_spectate_client.on_powerleft_update();
	}
	if(_message_type == FNAFMESSAGE_FROM_SERVER.SPECTATE_UPDATE_POWERUSAGE) {
		obj_spectate_client.power_usage = _message;
	}
	if(_message_type == FNAFMESSAGE_FROM_SERVER.SPECTATE_UPDATE_SCROLLVIEW) {
		obj_spectate_client.scroll_view = _message;
	}
	#endregion
}
#endregion


#region Send data to server prefix: send_client_...

send_client_state = function() {
	buffer_fnaf_create_and_send(server_connection,FNAFMESSAGE_FROM_CLIENT.SEND_CLIENT_STATE,obj_fnafguard_client.client_state);
}

send_client_platform = function () {
	buffer_fnaf_create_and_send(server_connection,FNAFMESSAGE_FROM_CLIENT.SEND_CLIENT_OS,os_type)
}
send_client_username = function() {
	buffer_fnaf_create_and_send(server_connection,FNAFMESSAGE_FROM_CLIENT.SEND_CLIENT_USERNAME,obj_fnafguard_client.username);
}

send_leftdoor_state = function() {
	buffer_fnaf_create_and_send(server_connection,FNAFMESSAGE_FROM_CLIENT.LEFTDOOR_UPDATE,obj_office.left_door);
}

send_flush_gameplay_request = function() {
	buffer_fnaf_create_and_send(server_connection,FNAFMESSAGE_FROM_CLIENT.FLUSH_GAMEPLAY_REQUEST,1);
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
	buffer_fnaf_create_and_send(server_connection,FNAFMESSAGE_FROM_CLIENT.POWERUSAGE_UPDATE,obj_night.current_power_usage);
}

send_scrollview_update = function() {
	buffer_fnaf_create_and_send(server_connection,FNAFMESSAGE_FROM_CLIENT.SCROLLVIEW_UPDATE,camera_get_view_x(view_camera[0]))
}
send_night_time_update = function() {
	buffer_fnaf_create_and_send(server_connection,FNAFMESSAGE_FROM_CLIENT.NIGHT_TIME_UPDATE,obj_night.current_hours);
}

send_bonniecam_update = function() {
	buffer_fnaf_create_and_send(server_connection,FNAFMESSAGE_FROM_CLIENT.BONNIECAM_UPDATE,obj_ai_bonnie.current_camera);
}
send_freddycam_update = function() {
	buffer_fnaf_create_and_send(server_connection,FNAFMESSAGE_FROM_CLIENT.FREDDYCAM_UPDATE,obj_ai_freddy.current_camera);
}
send_chicacam_update = function() {
	buffer_fnaf_create_and_send(server_connection,FNAFMESSAGE_FROM_CLIENT.CHICACAM_UPDATE,obj_ai_chica.current_camera);
}
send_foxycam_update = function() {
	buffer_fnaf_create_and_send(server_connection,FNAFMESSAGE_FROM_CLIENT.FOXYCAM_UPDATE,obj_ai_foxy.current_camera);
}

send_goldenfreddyphase_update = function() {
	buffer_fnaf_create_and_send(server_connection,FNAFMESSAGE_FROM_CLIENT.GOLDENFREDDYSTATE_UPDATE,obj_ai_goldenfreddy.phase);
}

send_cameralock_update = function() {
	buffer_fnaf_create_and_send(server_connection,FNAFMESSAGE_FROM_CLIENT.CAMERALOCK_UPDATE,obj_hitbox_camera.camera_lock);
}
send_freddypoweroutstate_update = function() {
	buffer_fnaf_create_and_send(server_connection,FNAFMESSAGE_FROM_CLIENT.FREDDYPOWEROUTPHASE_UPDATE,obj_ai_freddy_power_out.current_phase);
}

send_spectate_request = function(_target_id) {
	buffer_fnaf_create_and_send(server_connection,FNAFMESSAGE_FROM_CLIENT.SPECTATE_REQUEST,_target_id);
}

send_lobby_join_request = function(_lobby_name) {
	buffer_fnaf_create_and_send(server_connection,FNAFMESSAGE_FROM_CLIENT.LOBBY_JOIN_REQUEST,_lobby_name);
}
send_lobby_quit_request = function() {
	if(!obj_lobby_client.in_lobby) {
		show_message("WARNING: Tried to leave a lobby while there is no lobby to leave\nThe game will must likely crash now");
	}
	else buffer_fnaf_create_and_send(server_connection,FNAFMESSAGE_FROM_CLIENT.LOBBY_LEAVE_REQUEST,1);
}




#endregion

#region Reqeust data from server prefix: request_client_...
request_client_clientid = function() {
	buffer_fnaf_create_and_send(server_connection,FNAFMESSAGE_FROM_CLIENT.REQUEST_CLIENT_ID,1);
}
#endregion




