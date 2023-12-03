/// @description Insert description here
// You can write your code in this editor

start_camera = "1A";
current_camera = start_camera;
use_ai = true;
first_move = true;
ai_level = 10;
ai_chance_time = 4.97;
alarm_set(0,ai_chance_time*game_get_speed(gamespeed_fps));




//TODO: Complete robot AI.
forward_cameras = ["1B"];
backward_cameras = ["N/A"];


#region Functions
function animatronic_set_ai_level(_level) {
	ai_level=_level;
}

function animatronic_add_ai_level(_level) {
	ai_level+=_level;
}



function animatronic_add_forward_camera(_camera) {
	array_push(forward_cameras,_camera);
	if(array_get_index(forward_cameras,0) != -1) {
		var _index = array_get_index(forward_cameras,0);
		array_delete(forward_cameras,_index,1);
	}
}

function animatronic_add_backward_camera(_camera) {
	array_push(backward_cameras,_camera);
	if(array_get_index(backward_cameras,0) != -1) {
		var _index = array_get_index(backward_cameras,0);
		array_delete(backward_cameras,_index,1);
	}
}

function animatronic_shuffle_moves() {
	backward_cameras = array_shuffle(backward_cameras);
	forward_cameras = array_shuffle(forward_cameras);
}

function animatronic_flush_forward_cameras() {
	forward_cameras = array_create(1);
}

function animatronic_flush_backward_cameras() {
	backward_cameras = array_create(1);
}

//NOTE: Check for foxy here
function animatronic_is_valid_move(_cam) {
	return true;
}
#endregion


#region On animatronic move - Setup forward and backwards cameras. 
// NOTE: "LeftWindow" is for appearing on the window and "Attacked" is for door blocking/going back
// NOTE: "N/A" for no backward cameras available.
// Bonnie version
function on_animatronic_move() {
	animatronic_flush_backward_cameras();
	animatronic_flush_forward_cameras();
	
	if(current_camera == "1A") {
		animatronic_add_backward_camera("N/A");
		animatronic_add_forward_camera("1B");
	}
	if(current_camera == "1B") {
		animatronic_add_backward_camera("N/A");
		animatronic_add_forward_camera("5");
		animatronic_add_forward_camera("2A");
	}
	if(current_camera == "5") {
		animatronic_add_backward_camera("1B");
		animatronic_add_forward_camera("1B");
		animatronic_add_forward_camera("2A");
		animatronic_add_forward_camera("3");
	}
	if(current_camera == "2A") {
		animatronic_add_backward_camera("5");
		animatronic_add_backward_camera("1B");
		animatronic_add_forward_camera("5");
		animatronic_add_forward_camera("1B");
		animatronic_add_forward_camera("2B");
		animatronic_add_forward_camera("3");
	}
	if(current_camera == "2B") {
		animatronic_add_backward_camera("5");
		animatronic_add_backward_camera("1B");
		
		animatronic_add_forward_camera("2A");
		animatronic_add_backward_camera("3");
		animatronic_add_forward_camera("LeftWindow");
	}
	if(current_camera == "3") {
		animatronic_add_backward_camera("5");
		animatronic_add_backward_camera("1B");
		animatronic_add_backward_camera("2A");
		animatronic_add_forward_camera("2A");
		animatronic_add_forward_camera("LeftWindow");
		animatronic_add_forward_camera("2B");
	}	
	if(current_camera == "LeftWindow") {
		animatronic_add_backward_camera("N/A");
		animatronic_add_forward_camera("Attack");
	}
	if(current_camera == "Attack") {
		on_animatronic_attack();
	}
}

function on_animatronic_attack() {
	if(obj_office.left_door) {
		animatronic_add_backward_camera("N/A");
		animatronic_add_forward_camera("1B");
		animatronic_add_forward_camera("5");
	}
	else {
		//TODO: Code to block left door
		current_camera = "Attacked";
		return;
	}
}
#endregion




