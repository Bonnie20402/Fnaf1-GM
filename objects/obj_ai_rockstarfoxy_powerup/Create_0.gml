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

ui_x = 850;
ui_y = 150;


on_powerup_constant_update = function() {
	get_correct_sprite();
}
on_powerup_click = function() {
	if(obj_ai_rockstarfoxy.powerup_selected) return;
	obj_ai_rockstarfoxy.powerup_selected = true;

	if(blinking)return;
		switch(powerup_constant) {
		case ITEM.ITEM_CAMERASWAP:
			var _attack = new FnafAttack(obj_fnafguard_client.client_id,0,ITEM.ITEM_CAMERASWAP);
			_attack = json_stringify(_attack,true);
			buffer_fnaf_create_and_send(obj_fnafguard_client.server_connection,FNAFMESSAGE_FROM_CLIENT.CLASS_FNAFATTACK,_attack);
			break;
		case ITEM.ITEM_FORCEFOXYPHASE:
			var _attack = new FnafAttack(obj_fnafguard_client.client_id,0,ITEM.ITEM_FORCEFOXYPHASE);
			_attack = json_stringify(_attack,true);
			buffer_fnaf_create_and_send(obj_fnafguard_client.server_connection,FNAFMESSAGE_FROM_CLIENT.CLASS_FNAFATTACK,_attack);
			break;
		case ITEM.ITEM_ELETRICITYBILL:
			obj_ai_powerup_runner.run_powerup(ITEM.ITEM_ELETRICITYBILL);
			break;
		case ITEM.ITEM_ANIMATRONICOVERLOAD:
			obj_ai_powerup_runner.run_powerup(ITEM.ITEM_ANIMATRONICOVERLOAD);
			break;
		case ITEM.ITEM_RESETAI:
			obj_ai_powerup_runner.run_powerup(ITEM.ITEM_RESETAI);
			break;
			
	}
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
			description = "Gives or takes a random percentage of power from you.";
			break;
		case ITEM.ITEM_CAMERASWAP:
			sprite_index = spr_powerup_camerawap;
			image_xscale = 0.1;
			image_yscale = 0.1;
			description = "Swaps two camera buttons of a player randomly.";
			break;
		case ITEM.ITEM_FORCEFOXYPHASE:
			sprite_index = spr_powerup_foxyphase;
			image_xscale = 0.1;
			image_yscale = 0.1;
			description = "Forces a foxy phase on a random player.";
			break;
		case ITEM.ITEM_ANIMATRONICOVERLOAD:
			sprite_index = spr_powerup_animatronicoverload;
			image_xscale = 0.1;
			image_yscale = 0.1;
			description = "Reduces or raises the AI level of a random animatronic.";
			break;
		case ITEM.ITEM_RESETAI:
			sprite_index = spr_powerup_resetai;
			image_xscale = 0.1;
			image_yscale = 0.1;
			description = "Sends a animatronic back to their original position.";
	}
}


