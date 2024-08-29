/// @description Animatronic AI
// You can write your code in this editor
alarm_set(0,obj_ai_bonnie.ai_chance_time*game_get_speed(gamespeed_fps));
if(!obj_ai_bonnie.use_ai) return;



var _move = 1 + irandom(20);


//Check for movement opportunity.
if(obj_ai_bonnie.ai_level >= _move) {

	// go back 2 in a 5 chance.
	var _forward = random(1) <= backwards_chance && obj_ai_bonnie.backward_cameras[0] != "N/A" ? false : true;
	
	
	if(obj_ai_bonnie.current_camera == "Attack") { scr_camera_force_down();
	}
	//if on left window and left door is closed, always go forward. Else go backwards.
	if(obj_ai_bonnie.current_camera == "LeftWindow")  {
		_forward = !obj_core_gameplay.gameplay.left_door;
		if(_forward) {
			obj_ai_bonnie.current_camera = "Attack";
			obj_core_gameplay.gameplay.left_light = false;
			return;
		}
		else {
			obj_ai_bonnie.current_camera = "AttackFail";
			obj_ai_bonnie.on_animatronic_attack();
			return;
		}
	}
	//shuffle
	obj_ai_bonnie.animatronic_shuffle_moves();
	
	//Set the current camera
	if( scr_camera_is_camera_up() && obj_core_gameplay.gameplay.current_camera == obj_ai_bonnie.current_camera) obj_camera_current_spr.disable_camera();
	if( obj_ai_bonnie.animatronic_is_valid_move(_forward ? obj_ai_bonnie.forward_cameras[0] : obj_ai_bonnie.backward_cameras[0] ) ) {
		if(obj_ai_bonnie.forward_cameras[0] == "N/A") return;

		obj_ai_bonnie.current_camera = _forward ? obj_ai_bonnie.forward_cameras[0] : obj_ai_bonnie.backward_cameras[0];
		//Call the event
		obj_ai_bonnie.on_animatronic_move();
		
		
	
	}
}
//If succesfully attacked but missed the chance to flip monitor down, play breath sound
else if (obj_ai_bonnie.current_camera == "Attack" && scr_camera_is_camera_up()) {
	obj_ai_bonnie.animtronic_breath();
}

