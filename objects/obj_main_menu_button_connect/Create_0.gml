/// @description Cool stuff
// You can write your code in this editor

button_text = "Connect";

image_alpha = 0.2;
function on_button_click() {
	obj_fnafguard_client.on_client_disconnect();
	obj_input_client.run_input_ip();
}

