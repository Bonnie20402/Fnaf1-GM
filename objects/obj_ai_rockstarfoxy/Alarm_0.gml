/// @description Timer
// You can write your code in this editor


if(!foxy_visible)return;

alarm_set(0,1*game_get_speed(gamespeed_fps));
if(timer == 0) show_rockstar_foxy();
timer--;

