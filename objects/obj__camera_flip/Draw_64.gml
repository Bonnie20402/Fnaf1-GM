/// @description put middle camera
// You can write your code in this editor
if(!obj_hitbox_camera.camera_lock) return;

var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

var gui_scale = gui_w / camera_get_view_width(view_camera[0])
var y_offset = sprite_height/2

draw_sprite_ext(sprite_index, image_index, gui_w/2, gui_h - (y_offset)*gui_scale, gui_scale, gui_scale, 0,c_white, 1)






