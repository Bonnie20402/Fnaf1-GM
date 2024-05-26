/// @description Insert description here
// You can write your code in this editor

enabled = true;

foxy_visible = false;
talked=false;


function show_rockstar_foxy() {
	if(foxy_visible == false) {
		foxy_visible = true
		talked=false;
		visible = true;
		image_index = 0;
		image_speed = 1;
		
	} 
	else {
		foxy_visible = false
		image_index = image_number-1;
		image_speed = -1;
	}
}