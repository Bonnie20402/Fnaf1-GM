// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


enum LOBBYSTATE {
	ERROR,
	OPEN,
	STARTING,
	WAITING_FOR_LOADED_CLIENTS,
	IN_GAME,
	ENDING
}

enum LOBBY_JOIN_RESPONSE {
	ACCEPT,
	REJECTED
}

enum LOBBYACTION {
	KICK
}