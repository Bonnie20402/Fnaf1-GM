// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information



function buffer_fnaf_create(_message_type,_message) {
	_buffer = buffer_create(1,buffer_grow,1);
	buffer_write(_buffer,buffer_string,global.GAME_PROTOCOL);
	buffer_write(_buffer,buffer_u8,_message_type);
	if(is_string(_message)) buffer_write(_buffer,buffer_string,_message);
	else buffer_write(_buffer,buffer_u8,_message);
	buffer_seek(_buffer,buffer_seek_start,0);
	return _buffer;
}


function buffer_fnaf_send(_socket,_buffer) {
	network_send_raw(_socket,_buffer,buffer_get_size(_buffer))
	buffer_delete(_buffer);
}
