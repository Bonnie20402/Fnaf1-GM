/// @description Insert description here
// You can write your code in this editor


blink = false;
audio_play_sound(snd_6_am,0,false,1);
alarm_set(0,4*game_get_speed(gamespeed_fps));

//text blink alarm
alarm_set(1,4*game_get_speed(gamespeed_fps));
text = "5:59 AM";








