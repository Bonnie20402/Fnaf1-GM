/// @description Insert description here
// You can write your code in this editor

var _options = obj_main_menu_controller.options;



if(_options && image_index < image_number - 1) {
	image_speed = 1;
}

if(!_options && image_index > 0) {
	image_speed = -1;
}



if(_options && image_index == image_number -1) image_speed = 0;
else if (!_options && image_index == 0) image_speed = 0;

self.visible = !(image_speed == 0 && image_index == 0)








