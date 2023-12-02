

if(obj_office.camera_up && !obj_hitbox_camera.camera_lock) {
	draw_set_font(fnt_camera_current);
	draw_set_halign(fa_left);
	draw_text(x,y,get_camera_current_string());
}




