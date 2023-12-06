/// @description Power extra drain rate.
// You can write your code in this editor

if(!obj_night.run_night) return;

alarm_set(2,obj_night.power_extra_drain_rate*game_get_speed(gamespeed_fps));
obj_night.current_power-=0.1;
obj_night.on_power_update();









