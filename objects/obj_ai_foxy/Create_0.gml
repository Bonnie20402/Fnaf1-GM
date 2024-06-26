/// @description Foxy class :)
// You can write your code in this editor

start_camera = "1C_0";
current_camera = start_camera;
use_ai = false;
ai_level = 10;
ai_chance_time = 5.11;
jumpscare_time = 0.8;

is_running = false;
// Randiom frm 1 to 17.5
camera_down_time = 17.5;
// Time down.
alarm_set(2,game_get_speed(gamespeed_fps));

run_sound = -1;

alarm_set(0,ai_chance_time*game_get_speed(gamespeed_fps));
show_debug_message("foxy AI created - using ai? " + string(use_ai) );



forward_cameras = ["1C_1"];
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

//NOTE: Check for bonnie's ass here
function animatronic_is_valid_move(_cam) {
	if(_cam == "2A") {
		if(obj_ai_bonnie.current_camera == "2A" || obj_ai_bonnie.current_camera == "LeftWindow") return false;
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
	animatronic_flush_backward_cameras();
	animatronic_flush_forward_cameras();
	obj_camera_current_spr.update_current_camera_sprite();
	obj_gameplaycontroller_client.gameplay.current_foxy_cam = current_camera;
	obj_fnafguard_client.send_gameplay_update();
	if(current_camera == "1C_0") {
		animatronic_add_backward_camera("N/A");
		animatronic_add_forward_camera("1C_1");
	}
	if(current_camera == "1C_1") {
		animatronic_add_backward_camera("N/A");
		animatronic_add_forward_camera("1C_2");
	}
	if(current_camera == "1C_1") {
		
		animatronic_add_backward_camera("N/A");
		animatronic_add_forward_camera("1C_2");
	}
	if(current_camera == "1C_2") {
		animatronic_add_backward_camera("N/A");
		animatronic_add_forward_camera("2A");
	}
	if(current_camera == "2A") {
		obj_ai_foxy.camera_down_time = random_range(1,17.5);
		animatronic_add_forward_camera("N/A");
		animatronic_add_backward_camera("N/A");
	} 
	animatronic_shuffle_moves()
}

//Called after foxy run animation is complete.
function on_foxy_run_finish() {
	if(obj_fnafguard_client.is_spectating) return;
	current_camera = obj_gameplaycontroller_client.gameplay.left_door ? "AttackFail" : "AttackSuccess";
	is_running = false;
	obj_gameplaycontroller_client.gameplay.current_foxy_cam = current_camera;
	obj_fnafguard_client.send_gameplay_update();
	on_animatronic_attack();
}
function on_animatronic_attack() {
	animatronic_flush_backward_cameras();
	animatronic_flush_forward_cameras();
	if(obj_night.current_power == 0) return;
	if (current_camera == "AttackSuccess") {
		on_animatronic_jumpscare(); 
	}
	if(current_camera == "AttackFail") {
		audio_play_sound(snd_foxy_door_pounding,0,false);
		current_camera = "1C_1";
		//Subtract 1-4% from current power.
		obj_night.current_power-= irandom_range(10,40);
		if(obj_night.current_power) < 0 obj_night.current_power = 0;
		obj_ai_foxy.is_running = false;
		animatronic_add_forward_camera("1C_1");
		animatronic_add_backward_camera("N/A");
		on_animatronic_move();
	}
}

function on_animatronic_jumpscare() {
	scr_camera_force_down();
	audio_play_sound(snd_jumpscare,0,false);
	var _death = json_stringify(new GuardDeath(obj_fnafguard_client.client_id,0,GUARDDEATHCAUSE.BY_FOXY,obj_fnafguard_client.username),true);
	buffer_fnaf_create_and_send(obj_fnafguard_client.server_connection,FNAFMESSAGE_FROM_CLIENT.CLASS_GUARDDEATH,_death);
	obj_gameplaycontroller_client.gameplay.jumpscared = true;
	obj_gameplaycontroller_client.on_office_jumpscare();
	with(obj_office) {
		self.sprite_index = spr_office_jumpscare_foxy;
		self.image_index = 0;
		self.image_speed = 1;
	}
	alarm_set(1,jumpscare_time*game_get_speed(gamespeed_fps));
	
}
#endregion




