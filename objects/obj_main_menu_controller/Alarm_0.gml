/// @description Change freddy thing
// You can write your code in this editor
alarm_set(0,freddy_weird_time*game_get_speed(gamespeed_fps));
alarm_set(0,(freddy_weird_time*0.4) * game_get_speed(gamespeed_fps));
var _number =  1 + irandom(2);

var _id = layer_background_get_id("bg_freddy");
layer_background_index(_id,_number);




