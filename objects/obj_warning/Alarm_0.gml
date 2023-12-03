if ( draw_get_alpha() == 0 ) {
	room_goto(room_to_go);
	return;
}

alarm_set(0,0.1*game_get_speed(gamespeed_fps));
draw_set_alpha(draw_get_alpha()- 0.1);


