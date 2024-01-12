/// @descriptionUpdate the sprite based on the current active status
// You can write your code in this editor



// Update the sprite based on the current active status
// LEFT PANEL

// door0light0
var _sprite = spr_panel_left_light0door0;
if( !obj_gameplaycontroller_client.gameplay.left_door && !obj_gameplaycontroller_client.gameplay.left_light ) {
	_sprite = spr_panel_left_light0door0;
}

//door1light0
if( obj_gameplaycontroller_client.gameplay.left_door && !obj_gameplaycontroller_client.gameplay.left_light) {
	_sprite = spr_panel_left_light0door1;
}

//door0light1
if( !obj_gameplaycontroller_client.gameplay.left_door && obj_gameplaycontroller_client.gameplay.left_light) {
	_sprite = spr_panel_left_light1door0;
}

//door1light1
if( obj_gameplaycontroller_client.gameplay.left_door && obj_gameplaycontroller_client.gameplay.left_light) {
	_sprite = spr_panel_left_light1door1;
}

if (self.sprite_index != _sprite ) {
	self.sprite_index = _sprite
}





