/// @description Animatronic AI
// You can write your code in this editor
alarm_set(0,obj_ai_chica.ai_chance_time*game_get_speed(gamespeed_fps));
if(!obj_ai_chica.use_ai) return;



var _move = 1 + irandom(20);

//Check for movement opportunity.
if(obj_ai_chica.ai_level >= _move) {

	// go back 2 in a 5 chance.
	var _forward = random(1) <= backwards_chance && obj_ai_chica.backward_cameras[0] != "N/A" ? false : true;
	
	if (obj_ai_chica.current_camera == "AttackSuccess") scr_camera_force_down();
	//if on right window and right door is closed, always go forward. Else go backwards.
	if(obj_ai_chica.current_camera == "RightWindow")  {
		_forward = !obj_office.right_door;
		if(_forward) {
			obj_ai_chica.current_camera = "AttackSuccess";
			obj_office.right_light = false;
			obj_ai_chica.on_animatronic_attack();
			return;
		}
		else {
			obj_ai_chica.current_camera = "AttackFail";
			obj_ai_chica.on_animatronic_attack();
			return;
		}
	}
	//shuffle
	obj_ai_chica.animatronic_shuffle_moves();
	
	if( scr_camera_is_camera_up() && obj_office.current_camera == obj_ai_chica.current_camera) obj_camera_current_spr.disable_camera();
	//Set the current camera
	if( obj_ai_chica.animatronic_is_valid_move(_forward ? obj_ai_chica.forward_cameras[0] : obj_ai_chica.backward_cameras[0] ) ) {
		if(obj_ai_chica.forward_cameras[0] == "N/A") return;
		

		obj_ai_chica.current_camera = _forward ? obj_ai_chica.forward_cameras[0] : obj_ai_chica.backward_cameras[0];
		//Call the event
		obj_ai_chica.on_animatronic_move();
		
		
	
	}
}
else if (obj_ai_chica.current_camera == "AttackSuccess" && scr_camera_is_camera_up() && obj_ai_bonnie.current_camera != "AttackSuccess") {
	obj_ai_chica.animtronic_breath();
}
