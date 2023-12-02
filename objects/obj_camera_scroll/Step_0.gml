/// @description Insert description here
// You can write your code in this editor

if( position_meeting(x,y,obj_hitbox_edge) ) {
	self.left = !self.left;
	if(self.x > room_width / 2 ) x = 1400;
	else x = 200;
}

if(self.left) x-=scroll_speed;
else x+=scroll_speed;



