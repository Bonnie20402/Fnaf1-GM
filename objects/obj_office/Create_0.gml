/// @description Office game variables
// optimise whatever that shit is
// light flicker

office_surface = -1;
alarm_set(0,0.1*game_get_speed(gamespeed_fps));
application_surface_draw_enable(false);
//setup sounds
audio_play_sound(snd_light,0,true);
audio_play_sound(snd_fan,0,true,0.8);

/*
	Office variables
						*/




