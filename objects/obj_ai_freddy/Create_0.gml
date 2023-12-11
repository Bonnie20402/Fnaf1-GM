/// @description freddy class :)
// You can write your code in this editor

start_camera = "1A";
current_camera = start_camera;
use_ai = false;
ai_level = 10;
ai_chance_time = 3.21;
jumpscare_time = 0.8;

alarm_set(0,ai_chance_time*game_get_speed(gamespeed_fps));
show_debug_message("freddy AI created - using ai? " + string(use_ai) );



forward_cameras = ["1B"];
backward_cameras = ["N/A"];


#region Functions
function animatronic_set_ai_level(_level) {
	ai_level=_level;
}

function animatronic_add_ai_level(_level) {
	ai_level+=_level;
}

function play_freddy_hur(_num) {
	switch(_num) {
		case 0:
			audio_play_sound(snd_freddy_hur0,0,false);
			break;
		case 1:
			audio_play_sound(snd_freddy_hur1,0,false);
			break;
		case 2:
			audio_play_sound(snd_freddy_hur2,0,false);
			break;
	}
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

//NOTE: Check for chica's ass here
function animatronic_is_valid_move(_cam) {
	//Freddy is the last one to move their ass from show stage.
	if(_cam == "1B") {
		if(obj_ai_bonnie.current_camera == "1A" || obj_ai_chica.current_camera == "1A") return false;
	}
	if(_cam == "4A") {
		if(obj_ai_chica.current_camera == "4A") return false;
	}
	if(_cam == "4B") {
		if(obj_ai_chica.current_camera == "4B") return false;
	}
	return true;
}
#endregion


#region On animatronic move - Setup forward and backwards cameras. 
//NOTE: If Freddy fails an attack, they DO NOT GO back.
// NOTE: Freddy NEVER goes back, and always takes the biggest path.
// NOTE: "N/A" for no  cameras available - guranteed to not go to that direction.
// Freddy version
function on_animatronic_move() {
	play_freddy_hur(irandom(2));
	animatronic_flush_backward_cameras();
	animatronic_flush_forward_cameras();
	obj_camera_current_spr.update_current_camera_sprite();
	if (current_camera != "6") audio_stop_sound(snd_freddy_song);
	if(current_camera == "1A") {
		animatronic_add_backward_camera("N/A");
		animatronic_add_forward_camera("1B");
	}
	if(current_camera == "1B") {
		animatronic_add_backward_camera("N/A");
		animatronic_add_forward_camera("7");
	}
	if(current_camera == "7") {
		
		animatronic_add_backward_camera("N/A");
		animatronic_add_forward_camera("6");
	}
	if(current_camera == "6") {
		audio_play_sound(snd_freddy_song,0,true);
		animatronic_add_backward_camera("N/A");
		animatronic_add_forward_camera("4A");
	}
	if(current_camera == "4A") {
		animatronic_add_backward_camera("N/A");
		animatronic_add_forward_camera("4B");
	}
	if(current_camera == "4B") {
		animatronic_add_backward_camera("N/A");
		animatronic_add_forward_camera("N/A");
	}
	animatronic_shuffle_moves()
}

function on_animatronic_attack() {
	animatronic_flush_backward_cameras();
	animatronic_flush_forward_cameras();
	if (current_camera == "AttackSuccess") {
		on_animatronic_jumpscare();
	}
	if(current_camera == "AttackFail") {
		current_camera = "4A";
		animatronic_add_forward_camera("4B");
		animatronic_add_backward_camera("N/A");
		on_animatronic_move();
	}
}

function on_animatronic_jumpscare() {
	scr_camera_force_down();
	audio_play_sound(snd_jumpscare,0,false);
	obj_office.jumpscared = true;
	obj_office.on_office_jumpscare();
	with(obj_office) {
		self.sprite_index = spr_office_jumpscare_freddy;
		self.image_index = 0;
		self.image_speed = 1;
	}
	alarm_set(1,jumpscare_time*game_get_speed(gamespeed_fps));
	
}
#endregion




