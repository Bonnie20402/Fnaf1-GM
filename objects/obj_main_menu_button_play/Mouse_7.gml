/// @description on_button_click passthrough.
// You can write your code in this editor
if(os_browser == browser_not_a_browser) {
	
	if(!visible) return;
	obj_main_menu_controller.on_button_click(MENU.PLAY);
}
else {
	room_goto(rm_loading);
}




