/// @description Only make hitbox appear when user puts mouse in something else
// You can write your code in this editor

if(obj_gameplaycontroller_client.gameplay.jumpscared) return;

var _camera_up = obj_gameplaycontroller_client.gameplay.camera_up;
var _mouse_gui_x = device_mouse_x_to_gui(0);
var _mouse_gui_y = device_mouse_y_to_gui(0)
//Reminder - booleans are 0 (false) or 1 (true).



mouse_in = point_in_rectangle(_mouse_gui_x,_mouse_gui_y,initial_x,initial_y,initial_x + sprite_width, initial_y + sprite_height) ? true : false;
mouse_out = !mouse_in && _mouse_gui_y < initial_y + sprite_height;

#region Hover event
if(!obj_fnafguard_client.is_spectating) {
	if(!ui_lock && mouse_in) {
	if(obj_gameplaycontroller_client.gameplay.jumpscared || obj_night.current_power == 0) return;
	camera_lock = true;
	ui_lock = true;
	obj_gameplaycontroller_client.gameplay.camera_up = !obj_gameplaycontroller_client.gameplay.camera_up;
	obj_fnafguard_client.send_cameralock_update();
}
if(!camera_lock && mouse_out) {
	ui_lock = false;
}
}

#endregion


#region Appear after mouse leaves
if(camera_lock) {
	if(_camera_up && image_index == image_number-1 && image_speed == 0) {
		if(!point_in_rectangle(_mouse_gui_x,_mouse_gui_y,initial_x,initial_y,initial_x + sprite_width, initial_y + sprite_height) && !mouse_in ) {
			camera_lock = false;
		}
	}
	
	else if(!_camera_up && image_index == 0 && image_speed == 0) {
		if(!point_in_rectangle(_mouse_gui_x,_mouse_gui_y,initial_x,initial_y,initial_x + sprite_width, initial_y + sprite_height)  && !mouse_in) {
			camera_lock = false;
		}
	}
}
#endregion





