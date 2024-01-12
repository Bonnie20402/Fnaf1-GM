//Step event

/*
	Make sure it won't overlap on the right
	Formula to get the right part of the view:
	room_width - camera_get_view_width(view_camera[n];
*/
if (!obj_gameplaycontroller_client.gameplay.can_scroll) return;
if( x > room_width - camera_get_view_width(view_camera[0]) ) {
	x = room_width - camera_get_view_width(view_camera[0]);
}

if(x < 0) x = 0;

camera_set_view_pos(view_camera[0],x,y)
if(x != xprevious) obj_fnafguard_client.send_scrollview_update();
