/// @description Music Box Volume
// You can write your code in this editor


if(current_camera != "6") return;

var _volume = 0;

if(scr_camera_is_camera_up() ) {
	if(obj_core.gameplay.camera.current_camera == "6") _volume = 70;
	else if(obj_core.gameplay.camera.current_camera == "7" || obj_core.gameplay.camera.current_camera == "4A") _volume = 50;
	else if(obj_core.gameplay.camera.current_camera == "4B") _volume = 25;
	else if(obj_core.gameplay.camera.current_camera == "1B") _volume = 20;
	else _volume = 30;
}else _volume = 10;


audio_sound_gain(snd_freddy_song,_volume/100,250);





