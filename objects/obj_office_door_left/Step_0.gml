/// @description Toggling doorS
// You can write your code in this editor

var _left_door = obj_office.left_door;
if( image_index == 0 && image_speed != 0 || image_index == image_number-1 && image_speed != 0) {
	image_speed = 0;
	obj_hitbox_leftdoor.door_lock = false;
}


if(_left_door && image_index != image_number-1 && image_speed != 1) {
	image_speed = 1;
	obj_hitbox_leftdoor.door_lock = true;
}
else if(!_left_door && image_index != 0 && image_speed != -1) {
	image_speed = -1;
	obj_hitbox_leftdoor.door_lock = true;
}
















