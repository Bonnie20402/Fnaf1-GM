/// @description Only make hitbox appear when user puts mouse in something else
// You can write your code in this editor
var _camera_up = obj_office.camera_up;

if(camera_lock) {
	if(_camera_up && image_index == image_number-1 && image_speed == 0) {
		if(!point_in_rectangle(mouse_x,mouse_y,x,y,x + sprite_width, y + sprite_height) ) {
			camera_lock = false;
		}
	}
	
	else if(!_camera_up && image_index == 0 && image_speed == 0) {
		if(!point_in_rectangle(mouse_x,mouse_y,x,y,x + sprite_width, y + sprite_height) ) {
			camera_lock = false;
		}
	}
	
}





