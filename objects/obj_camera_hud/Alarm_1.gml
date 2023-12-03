/// @description Camera change effect
// You can write your code in this editor

alarm_set(1,0.04*game_get_speed(gamespeed_fps));
if(obj_camera_hud._camera_change_effect_frame < sprite_get_number(spr_office_camera_update)) {
	obj_camera_hud._camera_change_effect_frame++;
}

obj_camera_hud._camera_static_frame = obj_camera_hud._camera_static_frame < sprite_get_number(spr_office_camera_static) ? obj_camera_hud._camera_static_frame + 1 : 0;




