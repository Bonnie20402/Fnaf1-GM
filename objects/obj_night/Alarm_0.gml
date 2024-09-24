/// @description Update current power
// You can write your code in this editor

alarm_set(0,1*game_get_speed(gamespeed_fps));

// Keep draining power while power is not at 0, but yet still keep running the alarm.
if(!power_left.power_out) {
	power_left.run_power_cycle();
}












