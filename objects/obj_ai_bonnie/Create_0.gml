/// @description Bonnie class :)
// You can write your code in this editor

start_camera = "1A";
current_camera = start_camera;
use_ai = false;
ai_level = 10;
ai_chance_time = 4.97;
jumpscare_time = 0.8;
backwards_chance = 0.15;

alarm_set(0,ai_chance_time*game_get_speed(gamespeed_fps));
show_debug_message("Bonnie AI created - using ai? " + string(use_ai) );



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

	if(_cam == "2A" || _cam == "LeftWindow") {
		if(obj_ai_foxy.current_camera == "2A")return false;
	}
	return true;
}

function animtronic_breath() {
	var _sound = irandom(3);
	if(_sound == 0) audio_play_sound(snd_breath_0,0,false,0.2);
	if(_sound == 1) audio_play_sound(snd_breath_1,0,false,0.2);
	if(_sound == 2) audio_play_sound(snd_breath_2,0,false,0.2);
	if(_sound == 3) audio_play_sound(snd_breath_3,0,false,0.2);
}
#endregion


#region On animatronic move - Setup forward and backwards cameras. 
// NOTE: "LeftWindow" is for appearing on the window
// NOTE: "N/A" for no  cameras available - guranteed to not go to that direction.
// Bonnie version
function on_animatronic_move() {
	if(current_camera == "Attack" || current_camera == "AttackSucess") return;
	animatronic_flush_backward_cameras();
	animatronic_flush_forward_cameras();
	if(scr_camera_is_camera_up() && obj_core_gameplay.gameplay.current_camera == current_camera) obj_camera_current_spr.disable_camera();
	//spectate
	if(scr_camera_is_camera_up() && obj_spectate_client.gameplay.current_camera == current_camera) obj_camera_current_spr.disable_camera();
	obj_camera_current_spr.update_current_camera_sprite();
	obj_core_gameplay.gameplay.current_bonnie_cam = current_camera;
	
	if(current_camera == "1A") {
		animatronic_add_backward_camera("N/A");
		animatronic_add_forward_camera("1B");
		animatronic_add_forward_camera("5");
	}
	if(current_camera == "1B") {
		animatronic_add_backward_camera("N/A");
		animatronic_add_forward_camera("5");
		animatronic_add_forward_camera("2A");
	}
	if(current_camera == "5") {
		animatronic_add_backward_camera("1B");
		animatronic_add_forward_camera("2A");
		animatronic_add_forward_camera("3");
	}
	if(current_camera == "2A") {
		animatronic_add_backward_camera("1B");
		animatronic_add_forward_camera("2B");
		animatronic_add_forward_camera("3");
	}
	if(current_camera == "2B") {
		animatronic_add_backward_camera("2A");
		animatronic_add_forward_camera("3");
		animatronic_add_forward_camera("LeftWindow");
	}
	if(current_camera == "3") {
		animatronic_add_backward_camera("2A");
		animatronic_add_forward_camera("LeftWindow");
		animatronic_add_forward_camera("2B");
	}	
	if(current_camera == "LeftWindow") {
		animatronic_add_backward_camera("N/A");
		animatronic_add_forward_camera("Attack");
	}
	if(current_camera) == "AttackSuccess" obj_ai_bonnie.on_animatronic_jumpscare();
	animatronic_shuffle_moves()
}

function on_animatronic_attack() {
	animatronic_flush_backward_cameras();
	animatronic_flush_forward_cameras();
	if(current_camera == "AttackFail") {
		animatronic_add_backward_camera("N/A");
		animatronic_add_forward_camera("1B");
		animatronic_add_forward_camera("5");
		animatronic_shuffle_moves();
		obj_core_gameplay.gameplay.left_light_scare = false;
		current_camera = forward_cameras[0];
		
	}
	else {
		animatronic_add_backward_camera("N/A");
		animatronic_add_forward_camera("N/A");
	}
	obj_core_gameplay.gameplay.current_bonnie_cam = current_camera;
}

function on_animatronic_jumpscare() {
	obj_core_gameplay.gameplay.jumpscared = true;

	obj_core_gameplay.on_office_jumpscare();
	audio_play_sound(snd_jumpscare,0,false);
	with(obj_office) {
			self.sprite_index = spr_office_jumpscare_bonnie;
			self.image_index = 0;
			self.image_speed = 1;
		}


	alarm_set(1,jumpscare_time*game_get_speed(gamespeed_fps));
	
}
#endregion




