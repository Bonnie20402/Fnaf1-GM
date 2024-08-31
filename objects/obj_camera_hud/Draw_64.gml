/// @description Manual draw hud and recording icon.
// You can write your code in this editor

if(obj_core.gameplay.camera.camera_up && !obj_hitbox_camera.camera_lock) {
	draw_sprite(sprite_index,image_index,0,0);
	
	
	// rec icon
	var _rec_w = sprite_get_width(spr_office_camera_rec);
	var _rec_h = sprite_get_height(spr_office_camera_rec);	
	draw_sprite(spr_office_camera_rec,obj_camera_hud._rec_off ? 1 : 0,2*_rec_w,1*_rec_h);
	
	
	//effect gif
	if(obj_camera_hud._camera_change_effect_frame < sprite_get_number(spr_office_camera_update)) {
		draw_sprite(spr_office_camera_update,obj_camera_hud._camera_change_effect_frame,0,0);
	}
	
	//static gif
	draw_sprite_ext(spr_office_camera_static,obj_camera_hud._camera_static_frame,0,0,1,1,0,c_white,0.2);
}




