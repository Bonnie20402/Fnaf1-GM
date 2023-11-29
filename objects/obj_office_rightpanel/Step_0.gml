/// @description Update the sprite based on the current active status
// You can write your code in this editor



// Update the sprite based on the current active status
// RIGHT PANEL

// door0light0
var _sprite;
if( !obj_office.right_door && !obj_office.right_light ) {
	_sprite = spr_panel_right_light0door0;
}

//door1light0
if( obj_office.right_door && !obj_office.right_light) {
	_sprite = spr_panel_left_light0door1;
}

//door0light1
if( !obj_office.right_door && obj_office.right_light) {
	_sprite = spr_panel_right_light1door0;
}

//door1light1
if( obj_office.right_door && obj_office.right_light) {
	_sprite = spr_panel_right_light1door1;
}

//update sprite only if needed to reduce cpu usage?!
if (self.sprite_index != _sprite ) {
	self.sprite_index = _sprite
}





