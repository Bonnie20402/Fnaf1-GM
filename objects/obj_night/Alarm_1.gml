/// @description Update hours
// You can write your code in this editor
if(!obj_night.run_night || room != rm_office) return;
alarm_set(1,90*game_get_speed(gamespeed_fps));
if(obj_night.current_hours == 12) obj_night.current_hours = 1;
else obj_night.current_hours++;
obj_night.on_hour_update();










