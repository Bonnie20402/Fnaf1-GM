/// @description Insert description here
// You can write your code in this editor

mouse_gui_x = device_mouse_x_to_gui(0);
mouse_gui_y = device_mouse_y_to_gui(0);
self.active = obj_core_gameplay.gameplay.current_camera == camera_button;

#region VISIBLE
visible = view_visible[1] == true;
#endregion

#region CLICK HANDLING

if (!obj_core_gameplay.gameplay.camera_up) return;
// cant click same camera
if (obj_core_gameplay.gameplay.camera_up && !obj_hitbox_camera.camera_lock && obj_core_gameplay.gameplay.current_camera == self.camera_button) return;

if (mouse_check_button_pressed(mb_left)) {
    // Check if the mouse click is within the bounds of the drawn sprite
    if (point_in_rectangle(mouse_gui_x, mouse_gui_y, initial_x, initial_y, initial_x + sprite_width, initial_y + sprite_height)) {
		self.on_button_click();
	}
}

#endregion



