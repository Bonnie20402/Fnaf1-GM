/// @description Insert description here
// You can write your code in this editor
global.DEBUG = true;
global.PROTOCOL_VERSION = 1;
global.GAME_PROTOCOL = "ERICO E LARA LINDOS";

_guard_player = new GuardPlayer();
server_connection = network_create_socket(network_socket_tcp);
server_connection = network_connect_raw(server_connection,"localhost",1987);













