/// @description "activated effect alarm"
// You can write your code in this editor

if(self.active)alarm_set(0,1*game_get_speed(gamespeed_fps));


self.camera_button_frame_on = self.active ? !self.camera_button_frame_on : false;


