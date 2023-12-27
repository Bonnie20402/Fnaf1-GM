// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

enum GAMEMODE {
	NONE,
	BATTLE_ROYALE,
	CO_OP,
	OFFLINE,
	VERSUS
}


///@desc Returns the string equivalent of a Const.GAMEMODE
gamemode_string = function(_gm) {
	switch (_gm) {
		case GAMEMODE.NONE:
			return "No gamemode selected";
			break;
		case GAMEMODE.BATTLE_ROYALE:
			return "Battle Royale";
			break;
		case GAMEMODE.CO_OP:
			return "Co-op";
			break;
		case GAMEMODE.OFFLINE:
			return "Offline play";
			break;
		case GAMEMODE.VERSUS:
			return "Versus";
			break;
		default:
			return "Unknwown"
			break;
	}
}