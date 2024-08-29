/// @description Music Box Jingle and Walking to powered-out office
// You can write your code in this editor



if(obj_ai_freddy_power_out.current_phase == -1 || obj_ai_freddy_power_out.current_phase == 2) return;


alarm_set(0,5*game_get_speed(gamespeed_fps));

var _number = random(1);

if(_number <= 0.20 || obj_ai_freddy_power_out.misses == 3) {
	current_phase++;
	obj_ai_freddy_power_out.on_phase_update();
}
else  {
	obj_ai_freddy_power_out.misses++;
	on_miss_update();
}







