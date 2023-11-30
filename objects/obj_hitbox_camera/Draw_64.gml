/// @description Insert description here
// You can write your code in this editor

if(camera_lock) return;

var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

var gui_scale = gui_w / camera_get_view_width(view_camera[0])
var y_offset = sprite_height/2 + 7  // valorzinho para voar

draw_sprite_ext(sprite_index, image_index, gui_w/2, gui_h - (y_offset)*gui_scale, gui_scale * 0.7, gui_scale, 0,c_white, 1)





