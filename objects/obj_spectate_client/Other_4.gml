/// @description Send spec.request on office load
// You can write your code in this editor


if(room == rm_office && obj_fnafguard_client.is_spectating) {
	obj_fnafguard_client.send_spectate_request(spectating_id);
}



