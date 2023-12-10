// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


//The messages the CLIENT should send to the server
enum FNAFMESSAGE_FROM_CLIENT {
	VERSIONCHECK = 100,
	REQUEST_CLIENT_ID = 101,
	SEND_CLIENT_STATE = 102,
	SEND_CLIENT_OS = 103
}

//The messages the SERVER should send to the client(s).
enum FNAFMESSAGE_FROM_SERVER
{
	VERSIONCHECK = 200,
	UPDATE_CLIENT_ID = 201,
	SERVERSTATEUPDATE = 202
}
