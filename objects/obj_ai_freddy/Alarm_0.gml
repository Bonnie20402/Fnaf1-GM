/// @description Animatronic AI
// You can write your code in this editor
alarm_set(0,obj_ai_freddy.ai_chance_time*game_get_speed(gamespeed_fps));
if(!obj_ai_freddy.use_ai) return;



var _move = 1 + irandom(20);


// If freddy is on 4b, and guard is looking at 4b, freeze.
if(obj_ai_freddy.current_camera == "4B" && obj_gameplaycontroller_client.gameplay.current_camera == "4B") return;

//Check for movement opportunity.
if(obj_ai_freddy.ai_level >= _move) {
	//Freddy doesn't move if camera is up, unless if freddy is at 4B
	if(obj_gameplaycontroller_client.gameplay.camera_up && current_camera != "4B") return;
	// Freddy always goes forward.
	var _forward = true;
	
	
	//Freddy only attacks if the right door is open and the camera is not looking at him, while the camera is up.
	if(obj_ai_freddy.current_camera == "4B")  {
		if(obj_gameplaycontroller_client.gameplay.right_door) obj_ai_freddy.current_camera = "AttackFail";
		else if(obj_gameplaycontroller_client.gameplay.camera_up && obj_gameplaycontroller_client.gameplay.current_camera != "4B") {
			obj_ai_freddy.current_camera = "AttackSuccess";
			}
		obj_fnafguard_client.send_freddycam_update();
		obj_ai_freddy.on_animatronic_attack();
		return;
	}
	//shuffle
	obj_ai_freddy.animatronic_shuffle_moves();
	
	//Set the current camera
	if( obj_ai_freddy.animatronic_is_valid_move(_forward ? obj_ai_freddy.forward_cameras[0] : obj_ai_freddy.backward_cameras[0] ) ) {
		if(obj_ai_freddy.forward_cameras[0] == "N/A") return;
		

		obj_ai_freddy.current_camera = _forward ? obj_ai_freddy.forward_cameras[0] : obj_ai_freddy.backward_cameras[0];
		//Call the event
		obj_ai_freddy.on_animatronic_move();
		
		
	
	}
}
