/// @description Insert description here
// You can write your code in this editor

mouse_gui_x = device_mouse_x_to_gui(0);
mouse_gui_y = device_mouse_y_to_gui(0);
self.active = obj_office.current_camera == camera_button;
#region CLICK HANDLING

if (!obj_office.camera_up) return;
// cant click same camera
if (obj_office.camera_up && !obj_hitbox_camera.camera_lock && obj_office.current_camera == self.camera_button) return;

if (mouse_check_button_pressed(mb_left)) {
    // Check if the mouse click is within the bounds of the drawn sprite
    if (point_in_rectangle(mouse_gui_x, mouse_gui_y, initial_x, initial_y, initial_x + sprite_width, initial_y + sprite_height)) {
		//Loop through all button instances and put them in their "desactivated" state.
		with(obj_camera_button) self.camera_button_frame_on = false;
		//put this button into activated mode
		self.camera_button_frame_on = true;
		//start the blinking timer
		alarm_set(0,1*game_get_speed(gamespeed_fps));
		//update game variables
		obj_office.current_camera = self.camera_button;
		obj_camera_string.set_camera_current_string(self.camera_text); 
		//call my event
		scr_on_camera_change_start();
	}
}

#endregion

