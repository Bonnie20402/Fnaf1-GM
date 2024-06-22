/// @description Insert description here
// You can write your code in this editor

alarm_set(1,move_timer*game_get_speed(gamespeed_fps));

if (random(1) <= appear_chance) {
	show_rockstarfoxy_parrot();
}