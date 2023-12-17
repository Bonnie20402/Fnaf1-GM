
input_username = "";
input_lobby = "";
input_ip = "";
input_port = "";
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


