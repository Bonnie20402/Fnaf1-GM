
input_username = "";
input_lobby = "";
input_ip = "";
input_port = "";
input_spectate_target = "";
max_string_size = 64;


run_input_username = function() {
	input_username = get_string_async("Pick a username","");
}

run_input_lobby = function() {
	input_lobby = get_string_async("Insert lobby name","");
}

run_input_ip = function() {
	input_ip = get_string_async("IP address",obj_ipconfig_client.ip);
}

run_input_port = function() {
	input_port = get_integer_async("Port (default: 1987)",obj_ipconfig_client.port);
}

run_input_spectate_target = function() {
	input_spectate_target = get_integer_async("Enter the ID to spectate",0);
}


