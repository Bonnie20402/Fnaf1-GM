/// @description Update current power
// You can write your code in this editor


if(obj_fnafguard_client.is_spectating) return;
if(!obj_night.run_night || room != rm_office) return;

alarm_set(0,1*game_get_speed(gamespeed_fps));
if (obj_night.current_power > 0) {
	obj_night.current_power-=obj_night.current_power_usage;
	//make sure power  is never below 0.
	obj_night.current_power = obj_night.current_power <= 0 ? 0 : obj_night.current_power;
	obj_night.on_power_update();
}












