/// @description Insert description here
// You can write your code in this editor

enabled = true;
timer = 30;
powerup_selected = false;
foxy_visible = false;
talked=false;
powerup_instances = [];

function show_rockstar_foxy() {
	if(foxy_visible == false) {
		foxy_visible = true
		powerup_selected = false;
		talked=false;

		// Initialize the powerup_instances and _blacklist arrays
		powerup_instances = array_create(0,0);
		var _blacklist = array_create(0,0);
		var _consts = [1,2,3,4,5];
		_consts = array_shuffle(_consts)
		powerup_instances[0] = instance_create_depth(x+sprite_width,y,depth,obj_ai_rockstarfoxy_powerup)
		powerup_instances[0].powerup_constant = _consts[0]
		powerup_instances[0].on_powerup_constant_update();
		powerup_instances[1] = instance_create_depth(x+sprite_width,y + 120,depth,obj_ai_rockstarfoxy_powerup)
		powerup_instances[1].powerup_constant = _consts[1]
		powerup_instances[1].on_powerup_constant_update()
		powerup_instances[2] = instance_create_depth(x+sprite_width,y + 240,depth,obj_ai_rockstarfoxy_powerup)
		powerup_instances[2].powerup_constant = _consts[2]
		powerup_instances[2].on_powerup_constant_update()
		// Set the timer
		timer = 30;

		
		alarm_set(0,1*game_get_speed(gamespeed_fps));
		visible = true;
		image_index = 0;
		image_speed = 1;
		
	} 
	else {
		foxy_visible = false
		instance_destroy(powerup_instances[0]);
		instance_destroy(powerup_instances[1]);
		instance_destroy(powerup_instances[2]);
		image_index = image_number-1;
		image_speed = -1;
	}
}
