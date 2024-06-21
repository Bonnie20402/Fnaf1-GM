/// @description Insert description here
// You can write your code in this editor
if(!selected&& !blinking )return;
var _oldval = draw_get_valign();
var _oldhal = draw_get_halign();
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnt_camera_current)
//draw_text(x,y + textyoffset,description);

draw_rectangle_color(ui_x-ui_x/2,ui_y+30,ui_x+ui_x/2,ui_y-30,c_red,c_red,c_red,c_red,false);
draw_text(ui_x,ui_y,description);

draw_set_valign(_oldval);
draw_set_halign(_oldhal);