/// @description Chica class :)
// You can write your code in this editor

start_camera = "1A";
current_camera = start_camera;
use_ai = true;
ai_level = 10;
ai_chance_time = 4.98;
jumpscare_time = 0.8;

alarm_set(0,ai_chance_time*game_get_speed(gamespeed_fps));
show_debug_message("Chica AI created - using ai? " + string(use_ai) );



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

function animtronic_breath() {
	var _sound = irandom(3);
	if(_sound == 0) audio_play_sound(snd_breath_0,0,false,0.2);
	if(_sound == 1) audio_play_sound(snd_breath_1,0,false,0.2);
	if(_sound == 2) audio_play_sound(snd_breath_2,0,false,0.2);
	if(_sound == 3) audio_play_sound(snd_breath_3,0,false,0.2);
}

//NOTE: Check for freddy's ass here
function animatronic_is_valid_move(_cam) {
	if(_cam == "4A") {
		if(obj_ai_freddy.current_camera == "4A") return false;
	}
	if(_cam == "4B") {
		if(obj_ai_freddy.current_camera == "4B") return false;
	}
	return true;
}
#endregion


#region On animatronic move - Setup forward and backwards cameras. 
// NOTE: "LeftWindow" is for appearing on the window
// NOTE: "N/A" for no  cameras available - guranteed to not go to that direction.
// Bonnie version
function on_animatronic_move() {
	animatronic_flush_backward_cameras();
	animatronic_flush_forward_cameras();
	obj_camera_current_spr.update_current_camera_sprite();
	
	if(current_camera == "1A") {
		animatronic_add_backward_camera("N/A");
		animatronic_add_forward_camera("1B");
	}
	if(current_camera == "1B") {
		animatronic_add_backward_camera("N/A");
		animatronic_add_forward_camera("7");
		animatronic_add_forward_camera("4A");
	}
	if(current_camera == "7") {
		animatronic_add_backward_camera("1B");
		animatronic_add_forward_camera("6");
	}
	if(current_camera == "4A") {
		animatronic_add_backward_camera("6");
		animatronic_add_backward_camera("7");
		animatronic_add_backward_camera("1B");
		animatronic_add_forward_camera("4B");
		animatronic_add_forward_camera("RightWindow");
	}
	if(current_camera == "4B") {
		animatronic_add_backward_camera("6");
		animatronic_add_backward_camera("7");
		animatronic_add_backward_camera("1B");
		animatronic_add_backward_camera("4A");
		animatronic_add_forward_camera("RightWindow");
	}
	if(current_camera == "6") {
		animatronic_add_backward_camera("7");
		animatronic_add_backward_camera("1B");
		animatronic_add_forward_camera("4A");
	}	
	if(current_camera == "RightWindow") {
		animatronic_add_backward_camera("N/A");
		animatronic_add_forward_camera("Attack");
	}
	animatronic_shuffle_moves()
}

function on_animatronic_attack() {
	animatronic_flush_backward_cameras();
	animatronic_flush_forward_cameras();
	if(current_camera == "AttackFail") {
		animatronic_add_backward_camera("N/A");
		animatronic_add_forward_camera("1B");
		animatronic_add_forward_camera("7");
		animatronic_shuffle_moves();
		obj_office.right_light_scare = false;
		current_camera = forward_cameras[0];
	}
	else {
		animatronic_add_backward_camera("N/A");
		animatronic_add_forward_camera("N/A");
	}
}

function on_animatronic_jumpscare() {
	audio_play_sound(snd_jumpscare,0,false);
	obj_office.jumpscared = true;
	obj_office.on_office_jumpscare();
	with(obj_office) {
			self.sprite_index = spr_office_jumpscare_chica;
			self.image_index = 0;
			self.image_speed = 1;
		}
	alarm_set(1,jumpscare_time*game_get_speed(gamespeed_fps));
	
}
#endregion




