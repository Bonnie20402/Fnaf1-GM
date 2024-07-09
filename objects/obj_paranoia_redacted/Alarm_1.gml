/// @description Insert description here
// You can write your code in this editor

if(now_hallucinating) {
		if(current_blinks == max_blinks) {
		now_hallucinating = false;
		visible = false;
	}
	
	alarm_set(1,random_range(hallucinate_min,hallucinate_max)*game_get_speed(gamespeed_fps));
	visible = !visible;
	current_blinks++;
}