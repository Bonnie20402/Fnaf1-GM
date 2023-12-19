///@description Handle User Input


//Make sure the guy pressed Ok and its not empty.
if(async_load [? "status"] && async_load[? "result"] != ""  && async_load[? "result"] != 0 && string_length(async_load[? "result"]) <= max_string_size) {
	//Lobby name string
	if(async_load[? "id"] == input_lobby){
		obj_fnafguard_client.joining_lobby = async_load[? "result"]	;
		obj_fnafguard_client.on_client_joining_lobby_update();
	}
	//Username string
	if(async_load[? "id"] == input_username) {
		obj_fnafguard_client.username = async_load[? "result"];
		obj_fnafguard_client.on_client_username_update();
	}
	
	//IP
	if(async_load[? "id"] == input_ip) {
		obj_ipconfig_client.ip = async_load[? "result"];
		obj_ipconfig_client.on_ipconfig_ip_update();
	}
	//Port
	if(async_load[? "id"] == input_port) {
		obj_ipconfig_client.port = async_load[? "result"];
		obj_ipconfig_client.on_ipconfig_port_update();
	}
	if(async_load[? "id"] == input_spectate_target) {
		var _target = async_load[? "result"];
		obj_fnafguard_client.send_spectate_request(_target);
	}
}
