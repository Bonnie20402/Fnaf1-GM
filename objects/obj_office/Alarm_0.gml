/// @description Light flicker
// You can write your code in this editor

alarm_set(0,0.02*game_get_speed(gamespeed_fps));

if( !self.left_light && !self.right_light ) return;

var _number = irandom(20);

if (_number <= 3) {
	self.light_flickering = !self.light_flickering;
}
else light_flickering = false;




