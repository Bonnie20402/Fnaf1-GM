/// @description Insert description here
// You cvan write your code in this editor

var _text = "";
switch(self.current_option) {
	case ROOMLOBBY_OPTION.NONE:
		_text = "Pro tip: Hover into a button to know it's description!";
		break;
	case ROOMLOBBY_OPTION.START:
		_text = "Starts the match";
		break;
	case ROOMLOBBY_OPTION.BACK:
		_text = "Go to main menu, but stay in lobby.";
		break;
	case ROOMLOBBY_OPTION.QUIT:
		_text = "Leave the lobby.\nIf the lobby is empty after you leave, it will be deleted";
		break;
	case ROOMLOBBY_OPTION.SPECTATE:
		_text = "Spectate a nightguard.\nBROKEN AND I DONT HAVE TIME TO FIX IT";
		break;
	case ROOMLOBBY_OPTION.BONNIEHOVER:
		_text = "Bonnie appears at the left window.\n Use the left door to avoid them.";
		break;
	case ROOMLOBBY_OPTION.CHICAHOVER:
		_text = "Chica appears at the right window.\n Use the right door to avoid them.";
		break;
	case ROOMLOBBY_OPTION.FOXYHOVER:
		_text = "Foxy attacks from the Pirate Cove, running through the west hall to your office.\nCarefully watch camera 1C once in a while to stun them. You lose power each time they attack.";
		break;
	case ROOMLOBBY_OPTION.FREDDYHOVER:
		_text = "Freddy attacks from the East Hall Corner. Doesn't appear in right window.\nIf he is being watched, he gets stunned. He never goes back.";
		break;
	case ROOMLOBBY_OPTION.GOLDENHOVER:
		_text = "Golden Freddy pulls your camera tablet down.\nGo back to the cameras to get them away, or they will attack you.";
		break;
	case ROOMLOBBY_OPTION.PARROTHOVER:
		_text = "Rockstar Foxy gives you a powerup\n It either attacks opponents, debuffs you or helps your shift." 
		break;
	case ROOMLOBBY_OPTION.PAPHOVER:
		_text = "Modo de apresentacao PAP"
		break;
}


if(self.text != _text) {
	self.text=_text;
	audio_play_sound(snd_blop,0,false);
}



