/// @description Update the sprite based on the current active status
// You can write your code in this editor



// Update the sprite based on the current active status
// RIGHT PANEL

// door0light0
var _sprite = spr_panel_right_light0door0;

var _right_door = obj_core.gameplay.office.right_door;
var _right_light = obj_core.gameplay.office.right_light;

if( !_right_door && !_right_light ) {
	_sprite = spr_panel_right_light0door0;
}

//door1light0
if( _right_door && !_right_light) {
	_sprite = spr_panel_right_light0door1;
}

//door0light1
if( !_right_door && _right_light) {
	_sprite = spr_panel_right_light1door0;
}

//door1light1
if( _right_door && _right_light) {
	_sprite = spr_panel_right_light1door1;
}

//update sprite only if needed to reduce cpu usage?!
if (self.sprite_index != _sprite ) {
	self.sprite_index = _sprite
}





