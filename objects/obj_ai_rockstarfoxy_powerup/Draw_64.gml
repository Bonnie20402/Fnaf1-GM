/// @description Insert description here
// You can write your code in this editor
if(!selected)return;
var _oldval = draw_get_valign();
var _oldhal = draw_get_halign();
draw_set_halign(fa_right);
draw_set_valign(fa_middle);
draw_set_font(fnt_camera_current)
draw_text(room_width/2,0 + textyoffset,description);

draw_set_valign(_oldval);
draw_set_halign(_oldhal);