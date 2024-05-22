/// @description Insert description here
// You can write your code in this editor


enabled = window_get_fullscreen();
if(enabled && image_index == image_number-1) image_speed = 0;
if(!enabled && image_index == 0) image_speed = 0;


if(enabled && image_index == 0) image_speed = 1;
if(!enabled && image_index == image_number-1 ) image_speed = -1;

