/// @description Insert description here
// You can write your code in this editor
if(foxy_visible && image_index == image_number-1) {
	image_speed = 0;
	if(!talked) {
		talked=true;
		var _audio = irandom(3);
		if(_audio == 0) audio_play_sound(snd_ucn_rockstarfoxy_good1,0,false);
		if(_audio == 1) audio_play_sound(snd_ucn_rockstarfoxy_good2,0,false);
		if(_audio == 2) audio_play_sound(snd_ucn_rockstarfoxy_good3,0,false);
		if(_audio == 3) audio_play_sound(snd_ucn_rockstarfoxy_good4,0,false);
	}
}
else if(!foxy_visible && image_index == 0) {
	image_speed = 0;
	visible=false;
}