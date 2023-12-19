/// @description Insert description here
// You can write your code in this editor


#region CONNECTS/DISCONNECTS

if( async_load[? "type"] == network_type_connect ) {
	obj_fnafguard_client.on_client_connect();
}

#endregion

#region RECIEVING DATA

if(async_load[? "type"] == network_type_data ) {
	//Recieve the buffer
	var _buffer = async_load[? "buffer"];
	buffer_seek(_buffer,buffer_seek_start,0);
	//Recieve the buffer special header.
	var _game_protocol = buffer_read(_buffer,buffer_string);
	//Check if that header is the same as client's.
	if(_game_protocol == global.SERVER_GAME_PROTOCOL) {
		//Decode the message
		var _message_type = buffer_read(_buffer,buffer_u16);
		var _fnafbuffer_type = buffer_read(_buffer,buffer_u16);
		var _message = "ERROR";
		if(_fnafbuffer_type == FNAFBUFFER.ARRAY_STRING) {
			var _length = buffer_read(_buffer,buffer_u16);
			var _message = array_create(0,0);
			for(var _i = 0; _i < _length; _i++) {
				_message[_i] = buffer_read(_buffer,buffer_string);
			}
		}
		else if(_fnafbuffer_type == FNAFBUFFER.STRING) {
			_message = buffer_read(_buffer,buffer_string);
		}
		else if(_fnafbuffer_type == FNAFBUFFER.INT) {
			_message = buffer_read(_buffer,buffer_u16);
		}
		obj_fnafguard_client.on_server_message_recieved(_message_type,_message);
	}
	else show_debug_message("Invalid message recieved");
}

#endregion








