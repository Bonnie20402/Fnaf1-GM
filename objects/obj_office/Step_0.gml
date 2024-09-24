/// @description Office logic
// You can write your code in this editor

#region Sprite updating 

if(obj_night.power_left.power_out) return;

var _sprite;

var _left_light = obj_core.gameplay.office.left_light;
var _right_light = obj_core.gameplay.office.right_light;
var _left_light_sprite = obj_ai_bonnie.current_camera == "LeftWindow" ? spr_office_left_bonnie : spr_office_left_empty;
var _right_light_sprite = obj_ai_chica.current_camera == "RightWindow" ? spr_office_right_chica : spr_office_right_empty;
if(!_left_light && !_right_light) {
	_sprite = spr_office;
	
}
if (_left_light ) {
	_sprite = obj_core.gameplay.office.light_flickering ? spr_office : _left_light_sprite;
}

if (_right_light ) {
	//TODO: Change when adding animatronics!
	_sprite = obj_core.gameplay.office.light_flickering ? spr_office : _right_light_sprite;
}



if(sprite_index != _sprite) {
	sprite_index=_sprite;
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



