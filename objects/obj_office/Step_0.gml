/// @description Office logic
// You can write your code in this editor

#region Sprite updating 

if( jumpscared ) return;

var _sprite;

var _left_light_sprite = obj_ai_bonnie.current_camera == "LeftWindow" ? spr_office_left_bonnie : spr_office_left_empty;
var _right_light_sprite = obj_ai_chica.current_camera == "RightWindow" ? spr_office_right_chica : spr_office_right_empty;
if(!self.left_light && !self.right_light) {
	_sprite = spr_office;
	
}
if (self.left_light ) {
	_sprite = self.light_flickering ? spr_office : _left_light_sprite;
}

if (self.right_light ) {
	//TODO: Change when adding animatronics!
	_sprite = self.light_flickering ? spr_office : _right_light_sprite;
}



if(self.sprite_index != _sprite) {
	self.sprite_index=_sprite;
}
#endregion

#region Audio updating (based on current sprite)

if (sprite_index == spr_office && !audio_is_paused(snd_light) ) {
	audio_pause_sound(snd_light);
}
else if (sprite_index != spr_office )  {
	audio_resume_sound(snd_light);
	
	
}
#endregion



