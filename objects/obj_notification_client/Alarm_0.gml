/// @description Current alpha update
// You can write your code in this editor
if(!busy) return;
alarm_set(0,notification_effect_delay*game_get_speed(gamespeed_fps));
current_alpha = current_alpha - 0.1;

if(current_alpha == 0) {
	on_notification_finish();
}








