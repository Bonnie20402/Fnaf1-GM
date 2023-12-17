ip = "localhost";
port = 1987;


on_ipconfig_ip_update = function() {
	obj_input_client.run_input_port();
	return;
}

on_ipconfig_port_update = function() {
	obj_fnafguard_client.connect_client();
}