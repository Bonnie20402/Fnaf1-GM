/// @description Light flicker
// You can write your code in this editor

alarm_set(0,0.02*game_get_speed(gamespeed_fps));

if( !obj_gameplaycontroller_client.gameplay.left_light && !obj_gameplaycontroller_client.gameplay.right_light ) return;

var _number = irandom(20);

if (_number <= 3) {
	obj_gameplaycontroller_client.gameplay.light_flickering = !obj_gameplaycontroller_client.gameplay.light_flickering;
}
else obj_gameplaycontroller_client.gameplay.light_flickering = false;




