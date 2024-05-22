/// @description Insert description here
// You can write y-our code in this editor
var _x_offset = 30;

var _oldh = draw_get_halign();
var _oldv = draw_get_valign();


draw_set_font(fnt_camera_current)
draw_set_halign(fa_left)
draw_text(x+sprite_width + _x_offset,y+35,settings_text);


draw_set_halign(_oldh);
draw_set_valign(_oldv);