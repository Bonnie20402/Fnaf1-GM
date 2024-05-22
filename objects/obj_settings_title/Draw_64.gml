/// @description Insert description here
// You can write y-our code in this editor
var _oldh = draw_get_halign();
var _oldv = draw_get_valign();


draw_set_font(fnt_6_am)
draw_set_halign(fa_center)
draw_set_valign(fa_middle);
draw_text(room_width/2,y+30,settings_text);

draw_set_halign(_oldh);
draw_set_valign(_oldv);