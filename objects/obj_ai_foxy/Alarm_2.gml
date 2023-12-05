/// @description Camera Clock
// You can write your code in this editor


alarm_set(2,0.05*game_get_speed(gamespeed_fps));
if(!obj_office.camera_up && obj_ai_foxy.camera_down_time > 0.00 || obj_ai_foxy.current_camera == "2A" && obj_ai_foxy.camera_down_time > 0.00 ) {
	obj_ai_foxy.camera_down_time-=0.05;
	if(obj_ai_foxy.camera_down_time <= 0.00) obj_ai_foxy.camera_down_time = 0.00 ;
}










