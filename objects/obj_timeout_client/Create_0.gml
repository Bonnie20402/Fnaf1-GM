/// @description Insert description here
// You can write your code in this editor
default_office_loading_time = os_type == os_windows ? 30 : 45;
office_loading_time_left = default_office_loading_time;
timeout_time = 5000;
last_packet = current_time;



on_packet_recieved = function() {
	last_packet = current_time;
}








