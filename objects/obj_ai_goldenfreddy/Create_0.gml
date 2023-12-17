/// @description Insert description here
// You can write your code in this editor


visible = false;
depth = obj_office.depth-1;
in_office = false;
use_ai = false;

// Agressive mode : Triggers on any camera but 1C and 2A
agressive_mode = true;

//appear chance when gf has a chance
appear_chance = 0.02;

// kill the guard chance, every second once gf appears.
kill_chance = 0.25;

function on_goldenfreddy_appear() {
	in_office = true;
	visible = true;
	audio_play_sound(snd_goldenfreddy_laugh,0,false);
	scr_camera_force_down();
	alarm_set(1,2*game_get_speed(gamespeed_fps));
}

function on_goldenfreddy_disappear() {
	in_office = false;
	visible = false;
}


function goldenfreddy_chance() {
	if(!use_ai) return;
    // 80% chance of appearing
    if (!in_office) {
        var _number = random(1);
        if (_number <= appear_chance) {
            on_goldenfreddy_appear();
        }
    } else {
        // 30% chance of killing the guard.
        var _number = random(1);
        if (_number <= kill_chance) {
            // Code for killing the guard goes here
			on_animatronic_jumpscare();
        }
    }
}

function on_animatronic_jumpscare() {
	obj_office.on_office_jumpscare();
	obj_office.jumpscared = true;
	in_office = false;
	with(obj_office) {
		sprite_index = spr_office_jumpscare_goldenlara;
		depth = -1987;
		image_index = 0;
		image_speed = 0;
	}
	audio_play_sound(snd_goldenfreddy_jumpscare,0,false);
	alarm_set(0,0.75*game_get_speed(gamespeed_fps));
}


function scr_on_camera_change_start() {
	if(!agressive_mode) {
		if(obj_office.current_camera == "2B" && !in_office) goldenfreddy_chance();
	}
	else {
		if (obj_office.current_camera != "1C" && obj_office.current_camera != "2A") goldenfreddy_chance();
	}
}

function scr_on_camera_open_start() {
	if(in_office) {
		on_goldenfreddy_disappear();
	}
}








