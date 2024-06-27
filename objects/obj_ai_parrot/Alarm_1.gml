/// @description Insert description here
// You can write your code in this editor

alarm_set(1,move_timer*game_get_speed(gamespeed_fps));
if(!obj_lobby_client.lobby_gameplay_settings.rockstar_foxy_enabled) return;
if (random(1) <= appear_chance) {
	show_rockstarfoxy_parrot();
}