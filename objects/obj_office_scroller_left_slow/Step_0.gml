

x = camera_get_view_x(view_camera[0]);

if (point_in_rectangle(mouse_x, mouse_y, x, y, x + sprite_width, y + sprite_height)) {
	obj_office_scroller.x = obj_office_scroller.x - self.speed;

}












