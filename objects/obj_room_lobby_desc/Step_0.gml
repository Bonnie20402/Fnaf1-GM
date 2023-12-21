/// @description Insert description here
// You cvan write your code in this editor

var _text = "";
switch(self.current_option) {
	case ROOMLOBBY_OPTION.NONE:
		_text = "Hover into a button to know it's description!";
		break;
	case ROOMLOBBY_OPTION.START:
		_text = "Starts the match\n(You must be the lobby master)";
		break;
	case ROOMLOBBY_OPTION.BACK:
		_text = "Go to main menu, but stay in lobby.";
		break;
	case ROOMLOBBY_OPTION.QUIT:
		_text = "Leave the lobby.\n(If the lobby is empty after you leave, it will be deleted)";
		break;
	case ROOMLOBBY_OPTION.SPECTATE:
		_text = "Spectate a nightguard.\n(The match must be started already)";
		break;
}

if(self.text != _text) {
	self.text=_text;
	audio_play_sound(snd_blop,0,false);
}



