/// @description Insert description here
// You can write your code in this editor

if(now_hallucinating) {
	if(current_blinks >= max_blinks) {
		now_hallucinating = false;
		visible = false;
	}
	else if(random(1) <= blink_chance) {
		x = irandom(800);
		y = irandom(600);
		generate_setence()
		visible = !visible;
		current_blinks++;
	}
	alarm_set(1,random_range(hallucinate_min,hallucinate_max)*game_get_speed(gamespeed_fps));

}