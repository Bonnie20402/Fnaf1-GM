/// @description Insert description here
// You can write your code in this editor
rect_scale = 0.8;
image_xscale  = 0.30;
image_yscale = 0.30;
blinking = false;
max_blinks = 24;
blinks = 0;
blink_timer = 0.1;
selected = false;
textyoffset = 70
powerup_constant = ITEM.ITEM_ELETRICITYBILL;
description = "Item description.";


on_powerup_constant_update = function() {
	get_correct_sprite();
}
on_powerup_click = function() {
	if(blinking)return;
	start_blinking();
	audio_play_sound(snd_powerup_select,0,false);
}

start_blinking = function() {
	blinking = true;
	blinks = 0;
	alarm_set(2,blink_timer*game_get_speed(gamespeed_fps));
}

get_correct_sprite = function() {
	switch(powerup_constant) {
		case ITEM.ITEM_ELETRICITYBILL:
			sprite_index = spr_powerup_eletricitybill; 
			image_xscale = 0.1;
			image_yscale = 0.1;
			description = "Gives or takes a random percentage of power.";
			break;
		case ITEM.ITEM_CAMERASWAP:
			sprite_index = spr_powerup_camerawap;
			image_xscale = 0.1;
			image_yscale = 0.1;
			description = "Swaps all camera buttons of a opponent randomly.";
			break;
		case ITEM.ITEM_FORCEFOXYPHASE:
			sprite_index = spr_powerup_foxyphase;
			image_xscale = 0.1;
			image_yscale = 0.1;
			description = "Forces a foxy phase on a random opponent.";
	}
}