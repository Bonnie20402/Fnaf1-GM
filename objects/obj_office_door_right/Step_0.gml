/// @description Toggling doorS
// You can write your code in this editor

var _right_door = obj_gameplaycontroller_client.gameplay.right_door;
if( image_index == 0 && image_speed != 0 || image_index == image_number-1 && image_speed != 0) {
	image_speed = 0;
	obj_hitbox_rightdoor.door_lock = false;
}


if(_right_door && image_index != image_number-1 && image_speed != 1) {
	image_speed = 1;
	obj_hitbox_rightdoor.door_lock = true;
}
else if(!_right_door && image_index != 0 && image_speed != -1) {
	image_speed = -1;
	obj_hitbox_rightdoor.door_lock = true;
}
















