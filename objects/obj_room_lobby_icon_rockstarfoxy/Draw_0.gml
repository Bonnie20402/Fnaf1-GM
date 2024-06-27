/// @description Insert description here
// You can write your code in this editor

draw_self();
draw_set_font(fnt_camera_current);
draw_set_color(enabled ? c_lime : c_red);
draw_text(initial_x,initial_y,enabled ? "ON" : "OFF");

draw_set_color(c_white)



