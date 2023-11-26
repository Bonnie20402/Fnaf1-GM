/// @description Changes freddy frame!
// You can write your code in this editor
alarm_set(0,5*game_get_speed(gamespeed_fps));

var _number = irandom(sprite_get_number(self.sprite_index));
_number = _number > 0 ? 1 : _number;
self.image_index = _number;


