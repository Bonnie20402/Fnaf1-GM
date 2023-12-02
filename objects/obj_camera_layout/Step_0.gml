self.visible =obj_office.camera_up && obj__camera_flip.image_speed == 0 ? true : false;
//TODO check how to draw gui on the flip animation and do same here


//save some cpu
if(obj_office.camera_up) {
	self.x = (camera_get_view_x(view_camera[1]) + camera_get_view_width(view_camera[1]) - sprite_width ) + x_offset;
}




