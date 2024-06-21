/// @description Insert description here
// You can write your code in this editor
//check if mouse inside thing
if(scr_camera_is_camera_up()) return;
selected = point_in_rectangle(mouse_x,mouse_y,x,y,x+sprite_width,y+sprite_height)
if( selected ) draw_rectangle_color(x-rect_scale,y-rect_scale,x+sprite_width+rect_scale,y+sprite_height+rect_scale,c_white,c_white,c_white,c_white,false);
draw_self();

