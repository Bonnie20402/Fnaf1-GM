/// @description Office game variables
// optimise whatever that shit is
shader_reset()
application_surface_draw_enable(false)
// light flicker
alarm_set(0,0.1*game_get_speed(gamespeed_fps));


//setup sounds
audio_play_sound(snd_light,0,true);

/*
	Office variables
						*/

left_light = false;
right_light = false;
left_door = false;
right_door = false;

light_flickering = false;



