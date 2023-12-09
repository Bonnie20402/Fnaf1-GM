/// @description Insert description here
// You can write your code in this editor


#region CONNECTS/DISCONNECTS

if( async_load[? "type"] == network_type_connect ) {
	show_debug_message("Connected Waiting  version request...");
}

#endregion

#region RECIEVING DATA

if(async_load[? "type"] == network_type_data ) {
	//Recieve the buffer
	var _buffer = async_load[? "buffer"];
	
	//Recieve the buffer special header.
	var _game_protocol = buffer_read(_buffer,buffer_string);
	//Check if that header is the same as client's.
	if(_game_protocol == global.GAME_PROTOCOL) {
		var _message_type = buffer_read(_buffer,buffer_u8);
		scr_client_on_network_message(_message_type,_buffer)
	}
	else show_debug_message("Invalid message recieved");
}

#endregion








