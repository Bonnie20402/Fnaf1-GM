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

client_state = CLIENTSTATE.WAITING;




#region General actions (connect,disconnect)
connect_client = function() {
	server_connection = network_create_socket(network_socket_tcp);
	server_connection = network_connect(server_connection,"localhost",1987);
	show_debug_message("Connecting to server...");
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
}


on_client_out_of_date = function() {
	show_debug_message("This client is out of date!");
}

on_client_up_to_date = function() {
	show_debug_message("Client is up to date. Init...");
	client_state = CLIENTSTATE.WAITING;
	obj_client.send_client_state();
	
	obj_client.send_client_platform();
	
	obj_client.send_client_string();
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
	
	
}
#endregion


#region Send data to server prefix: send_client_...

send_client_state = function() {
	buffer_fnaf_create_and_send(server_connection,FNAFMESSAGE_FROM_CLIENT.SEND_CLIENT_STATE,obj_client.client_state);
}

send_client_platform = function () {
	buffer_fnaf_create_and_send(server_connection,FNAFMESSAGE_FROM_CLIENT.SEND_CLIENT_OS,obj_client.client_os)
}

send_client_string = function() {
	buffer_fnaf_create_and_send(server_connection,123,"just a test !");
}

#endregion

#region Boot
if(global.IS_CLIENT)connect_client();
#endregion

