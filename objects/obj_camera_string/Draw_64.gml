/// @description Insert description here
// You can write your code in this editor

if(obj_core.gameplay.camera.camera_up && !obj_hitbox_camera.camera_lock) {
	draw_set_font(fnt_camera_current);
	draw_set_halign(fa_left);
	draw_text(original_x,original_y,get_camera_current_string());
}


