// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


// Abstract the buffer creation

enum FNAFBUFFER {
	STRING,
	INT,
	ARRAY_STRING,
	ARRAY_INT,
	ARRAY_MIX
}


///@desc SERVER-SIDE and CLIENT-SIDE.
function buffer_fnaf_create_and_send(_socket,_message_type,_message) {
	var _buffer = buffer_fnaf_create(_message_type,_message);
	buffer_fnaf_send(_socket,_buffer);
}

///@desc SERVER-SIDE ONLY.
function buffer_fnaf_create_and_send_to_all(_message_type,_message) {
	for(var _i =0; _i < array_length(obj_server.clients) ; _i++) {
		if(obj_server.clients[_i].client_state != CLIENTSTATE.OFFLINE) {
			buffer_fnaf_create_and_send(_i,_message_type,_message)
		}
	}
}

///@DESC SERVER-SIDE ONLY.
function buffer_fnaf_create_and_send_to_lobby(_lobby,_message_type,_message) {
	var _index = obj_server.get_lobby_index(_lobby);
	if(_index != -1) {
		for(var _i =0;_i<array_length(obj_server.lobbies[_index].lobby_clients); _i++) {
			buffer_fnaf_create_and_send(obj_server.lobbies[_index].lobby_clients[_i],_message_type,_message)
		}
	}
	else {
		show_message("FATAL ERROR: Tried to broadcast a message to a non-existent lobby. Please contact the developer about this issue");
		game_end(0);
	}
}

///@DESC SERVER-SIDE ONLY. TODO FIX
function buffer_fnaf_create_and_send_to_lobby_except(_lobby,_message_type,_message,_except) {
	var _index = obj_server.get_lobby_index(_lobby);
	if(_index != -1) {
		for(var _i =0;_i<array_length(obj_server.lobbies[_index].lobby_clients); _i++) {
			if(obj_server.lobbies[_index].lobby_clients[_i] != _except) {
				buffer_fnaf_create_and_send(obj_server.lobbies[_index].lobby_clients[_i],_message_type,_message)
			}
		}
	}
	else {
		show_message("FATAL ERROR: Tried to broadcast a message (except!) to a non-existent lobby. Please contact the developer about this issue");
		game_end(0);
	}
}

/// @desc Creates a buffer for a pre-defined message
/// @param {any} _message_type The message type (stored in a enum)
/// @param {any} _message The message
/// @returns {Id.Buffer} The created buffer, seeked at start.

function buffer_fnaf_create(_message_type,_message) {
	var _buffer = buffer_create(1,buffer_grow,1);
	buffer_write(_buffer,buffer_string,global.SERVER_GAME_PROTOCOL);
	buffer_write(_buffer,buffer_u16,_message_type);
	if(is_array(_message) && is_string(_message[0]) ) {
		//Our fnafbuffer type is a array of strings
		buffer_write(_buffer,buffer_u16,FNAFBUFFER.ARRAY_STRING);
		//Write array length
		buffer_write(_buffer,buffer_u16,array_length(_message));
		//Write the array
		for(var _i = 0 ; _i < array_length(_message); _i++) {
			buffer_write(_buffer,buffer_string,_message[_i]);
		}
	}
	else if(is_string(_message)) {
		//Our fnafbuffer type is a SINGLE STRING
		buffer_write(_buffer,buffer_u16,FNAFBUFFER.STRING);
		buffer_write(_buffer,buffer_string,_message);
	}
	else if(is_numeric(_message)) {
		//Our fnafbuffer type is a SINGLE INT
		buffer_write(_buffer,buffer_u16,FNAFBUFFER.INT);
		buffer_write(_buffer,buffer_u16,_message);
	}
	buffer_seek(_buffer,buffer_seek_start,0);
	return _buffer;
}


/**
 * Sends a buffer to the socket, and then deletes it Seeks the buffer from the start.
 * @param {id.Socket} _socket Socket to send the buffer to
 * @param {id.Buffer} _buffer The buffer to send.
 */
function buffer_fnaf_send(_socket,_buffer) {
	buffer_seek(_buffer,buffer_seek_start,0);
	_bytes = network_send_packet(_socket,_buffer,buffer_get_size(_buffer));
	buffer_delete(_buffer);
}
