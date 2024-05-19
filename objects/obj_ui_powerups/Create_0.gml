/// @description Insert description here
// You can write your code in this editor
surf_id = 0;
powerup_countdown = 0;
powerup_active = false;
sequence = "";
function ui_layer_script_begin(){
	show_message("aa");
	shader_reset();
	surface_set_target(global.ui_surface);

}

function ui_layer_script_end(){
	surface_reset_target();
}

layer_script_begin("UI", ui_layer_script_begin);
layer_script_end("UI", ui_layer_script_end);


function test_powerup(_sec) {
	powerup_countdown = _sec;
	powerup_active = true;
	alarm_set(3,1*game_get_speed(gamespeed_fps));
	sequence = layer_sequence_create("UI",room_width/2,room_height/2,seq_test);
	layer_sequence_headpos(sequence,0)
	layer_sequence_xscale(sequence,0.3);
	layer_sequence_yscale(sequence,0.3);
	layer_sequence_speedscale(sequence,1/_sec) 
	layer_sequence_play(sequence);
}

