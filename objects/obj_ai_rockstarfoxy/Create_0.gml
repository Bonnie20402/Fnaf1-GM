/// @description Insert description here
// You can write your code in this editor

enabled = true;
timer = 30;
foxy_visible = false;
talked=false;
powerup_instances = [];

function show_rockstar_foxy() {
	if(foxy_visible == false) {
		foxy_visible = true
		talked=false;
		powerup_instances[0] = instance_create_depth(x+sprite_width,y,depth,obj_ai_rockstarfoxy_powerup)
		powerup_instances[1] = instance_create_depth(x+sprite_width,y + 120,depth,obj_ai_rockstarfoxy_powerup)
		timer = 30;
		powerup_instances[1].powerup_constant = ITEM.ITEM_CAMERASWAP;
		alarm_set(0,1*game_get_speed(gamespeed_fps));
		visible = true;
		image_index = 0;
		image_speed = 1;
		
	} 
	else {
		foxy_visible = false
		instance_destroy(powerup_instances[0]);
		instance_destroy(powerup_instances[1]);
		image_index = image_number-1;
		image_speed = -1;
	}
}