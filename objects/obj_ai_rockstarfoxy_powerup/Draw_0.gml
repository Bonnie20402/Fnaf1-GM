/// @description Insert description here
// You can write your code in this editor
//check if mouse inside thing
switch(powerup_constant) {
	case ITEM.ITEM_ELETRICITYBILL:
		sprite_index = spr_powerup_eletricitybill; 
		image_xscale = 0.1;
		image_yscale = 0.1;
		description = "Gives or takes a random percentage of power.";
		break;
	case ITEM.ITEM_CAMERASWAP:
		sprite_index = spr_powerup_camerawap;
		image_xscale = 0.1;
		image_yscale = 0.1;
		description = "Swaps all camera buttons of a opponent randomly.";
}
selected = point_in_rectangle(mouse_x,mouse_y,x,y,x+sprite_width,y+sprite_height)
if( selected ) draw_rectangle_color(x-rect_scale,y-rect_scale,x+sprite_width+rect_scale,y+sprite_height+rect_scale,c_white,c_white,c_white,c_white,false);
draw_self();

