/// @description Insert description here
// You can write your code in this editor

visible = is_settings_button && obj_main_menu_controller.options || !is_settings_button && !obj_main_menu_controller.options

button_text = obj_lobby_client.in_lobby ? "Return to lobby" : "Join a lobby";

if(os_browser != browser_not_a_browser) {
	button_text = "Jogar noite 5";
}