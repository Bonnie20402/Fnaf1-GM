// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
/// @desc Should be called  a verified message has been recieved from a client.
/// @param {Constant.FNAFMESSAGE_FROM_SERVER} _message_type The message type (enum FNAFMESSAGE)
/// @param {Id.Buffer} _message The buffer with the pointer already in the start of message
function scr_client_on_network_message(_message_type,_message){
	if(global.DEBUG) {
		show_debug_message("Message type " + string(_message_type) +
		" recieved from server"
		+ ":" + string(_message));
	}
	switch(_message_type) {
		#region  Recieve from Server a VERSION CHECK
		case FNAFMESSAGE_FROM_SERVER.VERSIONCHECK:
			show_debug_message("Version check...")
			//Check if the version between server and client is the same
			var _version = buffer_read(_message,buffer_u8)
			if(global.PROTOCOL_VERSION == _version) {
				show_debug_message("Client up-to-date! Obtaining a client id...");
				scr_client_request_clientid();

			}
			else show_debug_message("Client out of date!");
			break;
			#endregion

		#region Recieve from server my client id!
		
		case(FNAFMESSAGE_FROM_SERVER.UPDATE_CLIENT_ID):
			var _id = buffer_read(_message,buffer_u8);
			scr_client_recieve_clientid(_id);
			break;
			#endregion
		}
}