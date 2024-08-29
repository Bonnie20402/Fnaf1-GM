/// @description Animatronic AI
// You can write your code in this editor
alarm_set(0,obj_ai_foxy.ai_chance_time*game_get_speed(gamespeed_fps));
if(!obj_ai_foxy.use_ai) return;



var _move = 1 + irandom(20);

//Check for movement opportunity.
if(obj_ai_foxy.ai_level >= _move && obj_ai_foxy.camera_down_time == 0.0) {
	//foxy doesn't move if camera is up, unless they are at 2A and "camera timer", which is now a tolerance timer, ran out..
	if(obj_core_gameplay.gameplay.camera_up && obj_ai_foxy.current_camera != "2A") return;
	// foxy always goes forward.
	var _forward = true;
	
	
	//foxy only attacks if the right door is open and the camera is not looking at him, while the camera is up.
	// Foxzy also attacks if he has not ran after getting out of pirate cove.
	if(obj_ai_foxy.current_camera == "2A" && !obj_ai_foxy.is_running)  {
		if(obj_core_gameplay.gameplay.left_door) obj_ai_foxy.current_camera = "AttackFail";
		else obj_ai_foxy.current_camera = "AttackSuccess";
		obj_core_gameplay.gameplay.current_foxy_cam = current_camera;
		
		obj_ai_foxy.on_animatronic_attack();
		return;
	}
	//shuffle
	obj_ai_foxy.animatronic_shuffle_moves();
	
	//Set the current camera
	if( obj_ai_foxy.animatronic_is_valid_move(_forward ? obj_ai_foxy.forward_cameras[0] : obj_ai_foxy.backward_cameras[0] ) ) {
		if(obj_ai_foxy.forward_cameras[0] == "N/A") return;
		

		obj_ai_foxy.current_camera = _forward ? obj_ai_foxy.forward_cameras[0] : obj_ai_foxy.backward_cameras[0];
		//Call the event
		obj_ai_foxy.on_animatronic_move();
		
		
	
	}
}
