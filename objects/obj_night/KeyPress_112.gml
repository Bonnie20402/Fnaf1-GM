/// @description 6 AM
// You can write your code in this editor

if(room == rm_main_menu) {
	obj_night.current_night = 6;
}
else {
	obj_night.current_hours = 6;
	obj_night.on_hour_update();
}









