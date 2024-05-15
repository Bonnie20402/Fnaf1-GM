/// @description Insert description here
// You can write your code in this editor
if(!powerup_active) return;

var _draw_x = layer_sequence_get_x(sequence) 
var _draw_y = layer_sequence_get_y(sequence) 
draw_set_font(fnt_camera_button)
draw_text(_draw_x,_draw_y,powerup_countdown);