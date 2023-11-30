/// @description put middle camera
// You can write your code in this editor
if(!obj_hitbox_camera.camera_lock) return;

var _gui_w = display_get_gui_width();
var _gui_h = display_get_gui_height();

var _gui_scale = _gui_w / camera_get_view_width(view_camera[0])
var _y_offset = sprite_height/2

draw_sprite_ext(sprite_index, image_index, _gui_w/2, _gui_h - (_y_offset)*_gui_scale, _gui_scale, _gui_scale, 0,c_white, 1)






