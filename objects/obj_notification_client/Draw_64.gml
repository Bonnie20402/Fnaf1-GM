/// @description Insert description here
// You can write your code in this editor
var _ui_x = display_get_gui_width() - 100;
var _ui_y = display_get_gui_height() - 25;
if(array_length(notification_queue) == 0) return;
var _oldha = draw_get_halign();
draw_set_font(fnt_camera_current);

if(room != rm_office) {
	draw_text_color(_ui_x,_ui_y,text,c_white,c_white,c_white,c_white,current_alpha);
	draw_set_halign(fa_right);
}
else {
	draw_text_color(900,180,text,c_white,c_white,c_white,c_white,current_alpha);
	draw_set_halign(fa_center);
} 

draw_set_halign(_oldha);










