/// @description Scroll to the right logic



x = camera_get_view_width(view_camera[0]) + camera_get_view_x(view_camera[0]) - (sprite_width) ;

if (point_in_rectangle(mouse_x, mouse_y, x, y, x + sprite_width, y + sprite_height)) {
	obj_office_scroller.x+=speed;
	if(obj_office_scroller.x) > ( room_width - obj_office_scroller.x) {
	obj_office_scroller.x  = room_width - obj_office_scroller.x;
	}

}












