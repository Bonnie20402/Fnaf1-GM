/// @description Office game variables
// optimise whatever that shit is
// light flicker
alarm_set(0,0.1*game_get_speed(gamespeed_fps));
application_surface_draw_enable(false)

//setup sounds
audio_play_sound(snd_light,0,true);

/*
	Office variables
						*/

left_light = false;
right_light = false;
left_door = false;
right_door = false;

camera_up = false;
light_flickering = false;



