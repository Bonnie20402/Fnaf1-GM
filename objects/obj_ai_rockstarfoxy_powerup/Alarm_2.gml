/// @description Blink
// You can write your code in this editor
if(blinks >= max_blinks) {
	visible=true;
	blinking = false;
	return;
}

blinks++;
alarm_set(2,blink_timer*game_get_speed(gamespeed_fps));

if(sprite_index != spr_powerups) sprite_index = spr_powerups;
else self.get_correct_sprite();