/// @description Running away from 2A
// You can write your code in this editor

if(!audio_is_playing(snd_foxy_run) && obj_ai_foxy.current_camera == "2A" && obj_ai_foxy.is_running) {
	obj_ai_foxy.on_foxy_run_finish();
	obj_camera_current_spr.update_current_camera_sprite();
}








