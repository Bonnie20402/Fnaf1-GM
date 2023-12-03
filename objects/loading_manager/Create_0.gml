/// @description Insert description here
// You can write your code in this editor
for(var _i =0; _i<1024; _i++ ) {
	if (sprite_exists(_i)) {
		var _name = sprite_get_name(_i);
		sprite_flush(_name);
	}
}
global.game_loading = true;
scr_loading();

alarm_set(0,0.3*game_get_speed(gamespeed_fps));


