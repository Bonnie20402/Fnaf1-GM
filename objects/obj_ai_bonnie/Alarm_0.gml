/// @description Animatronic AI
// You can write your code in this editor
alarm_set(0,obj_ai_bonnie.ai_chance_time*game_get_speed(gamespeed_fps));
if(!obj_ai_bonnie.use_ai) return;


var _move = irandom(20);

//Check for movement opportunity.
if(obj_ai_bonnie.ai_level >= _move) {
	// go back 2 in a 5 chance.
	var _forward = irandom(5) < 2 && obj_ai_bonnie.backward_cameras[0] != "N/A" ? false : true;
	//Shuffle the array to randomize the gamera to go to.
	obj_ai_bonnie.animatronic_shuffle_moves();
	//Set the current camera
	if( obj_ai_bonnie.animatronic_is_valid_move(_forward ? obj_ai_bonnie.forward_cameras[0] : obj_ai_bonnie.backward_cameras[0] ) ) {
		obj_ai_bonnie.current_camera = _forward ? obj_ai_bonnie.forward_cameras[0] : obj_ai_bonnie.backward_cameras[0];
		//Call the event
		obj_ai_bonnie.on_animatronic_move();
	}
}
