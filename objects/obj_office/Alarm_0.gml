/// @description Light flicker
// You can write your code in this editor

alarm_set(0,0.02*game_get_speed(gamespeed_fps));
var _left_light = obj_core.gameplay.office.left_light;
var _right_light = obj_core.gameplay.office.right_light;


if( !_left_light && !_right_light ) return;

var _number = irandom(20);

if (_number <= 3) {
	obj_core.gameplay.office.light_flickering = !obj_core.gameplay.office.light_flickering;
}
else obj_core.gameplay.office.light_flickering = false;




