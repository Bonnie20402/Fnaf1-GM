/// @description Insert description here
// You can write your code in this editor
/// @description Powerup countdown
// You can write your code in this editor

if(powerup_active) {
	alarm_set(3,1*game_get_speed(gamespeed_fps));
	powerup_countdown--;
	if(powerup_countdown<=0)  {
		audio_play_sound(snd_pop0,0,false);
		powerup_active=false;
	}
}