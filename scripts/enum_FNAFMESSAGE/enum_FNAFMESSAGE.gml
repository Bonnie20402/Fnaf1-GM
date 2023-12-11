// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


//The messages the CLIENT should send to the server


//Almost all constants that don't end with _UPDATE shouldn't be expected to have anything on the mssage.
enum FNAFMESSAGE_FROM_CLIENT {
	VERSIONCHECK = 100,
	SEND_CLIENT_STATE = 102,
	SEND_CLIENT_OS = 103,
	REQUEST_CLIENT_ID = 104,
	
	LEFTDOOR_UPDATE = 105,
	RIGHTDOOR_UPDATE = 106,
	LEFTLIGHT_UPDATE = 107,
	RIGHTLIGHT_UPDATE = 108,
	CAMERAUP_UPDATE = 109,
	CURRENTCAMERA_UPDATE = 110,
	NIGHT_TIME_UPDATE = 111,
	NIGHT_LOSE = 112,
	NIGHT_WIN = 113,
	POWERLEFT_UPDATE = 114,
	POWERUSAGE_UPDATE = 115,
	POWEROUT = 116,
	REQUEST_FNAF_ATTACK = 117
}

//The messages the SERVER should send to the client(s).
enum FNAFMESSAGE_FROM_SERVER
{
	KEEP_ALIVE = 200,
	VERSIONCHECK = 201,
	UPDATE_CLIENT_ID = 202,
	SERVERSTATEUPDATE = 203,
	UPDATE_ALIVE_GUARDS = 204,
	NEW_FNAF_ATTACK = 205
}
