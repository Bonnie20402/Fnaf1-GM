/// @description Insert description here
// You can write your code in this editor


if(random(1) <= hallucinate_chance && !now_hallucinating) {
	now_hallucinating = true;
	current_blinks = 0;
	visible = true;
	show_message("sou eu");
	alarm_set(1,random_range(hallucinate_min,hallucinate_max)*game_get_speed(gamespeed_fps));
}