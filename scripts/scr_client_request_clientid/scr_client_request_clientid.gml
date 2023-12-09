// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

///@description Requests what is the server's client id for this client.
function scr_client_request_clientid(){
	var _buffer = buffer_fnaf_create(FNAFMESSAGE_FROM_CLIENT.REQUEST_CLIENT_ID,0);
	_socket = obj_client.server_connection;
	buffer_fnaf_send(_socket,_buffer);
}
