// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

///@description Updates the client id.
function scr_client_recieve_clientid(_id){
	show_debug_message("I got the client id:" + string(_id));
	obj_client._guard_player.client_id = _id;
}


