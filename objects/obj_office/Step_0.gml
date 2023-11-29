/// @description Office logic
// You can write your code in this editor

#region Sprite updating 
var _sprite;

if(!self.left_light && !self.right_light) {
	_sprite = spr_office;
	
}
if (self.left_light ) {
	_sprite = self.light_flickering ? spr_office : spr_office_leftLight_empty;
}

if (self.right_light ) {
	//TODO: Change when adding animatronics!
	_sprite = self.light_flickering ? spr_office : spr_office_rightLight_empty;
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



