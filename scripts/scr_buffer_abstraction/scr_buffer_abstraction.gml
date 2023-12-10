// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


// Abstract the buffer creation

enum FNAFBUFFER {
	STRING = 1,
	INT = 0
}

function buffer_fnaf_create_and_send(_socket,_message_type,_message) {
	var _buffer = buffer_fnaf_create(_message_type,_message);
	buffer_fnaf_send(_socket,_buffer);
}


/// @desc Creates a buffer for a pre-defined message
/// @param {any} _message_type The message type (stored in a enum)
/// @param {any} _message The message
/// @returns {Id.Buffer} The created buffer, seeked at start.

function buffer_fnaf_create(_message_type,_message) {
	var _buffer = buffer_create(1,buffer_grow,1);
	buffer_write(_buffer,buffer_string,global.SERVER_GAME_PROTOCOL);
	buffer_write(_buffer,buffer_u8,_message_type);
	if(is_string(_message)) {
		//Used to check if the buffer shall be treated as a string or int
		buffer_write(_buffer,buffer_u8,FNAFBUFFER.STRING);
		buffer_write(_buffer,buffer_string,_message);
	}
	else {
		//Used to check if the buffer shall be treated as a string or int
		buffer_write(_buffer,buffer_u8,FNAFBUFFER.INT);
		buffer_write(_buffer,buffer_u8,_message);
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
	show_debug_message("Sent " + string(_bytes) + " bytes to socket id " + string(_socket) )
	buffer_delete(_buffer);
}
