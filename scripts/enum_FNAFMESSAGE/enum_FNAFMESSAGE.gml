// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


//The messages the CLIENT should send to the server
enum FNAFMESSAGE_FROM_CLIENT {
	VERSIONCHECK,
	REQUEST_CLIENT_ID
}

//The messages the SERVER should send to the client(s).
enum FNAFMESSAGE_FROM_SERVER
{
	VERSIONCHECK,
	UPDATE_CLIENT_ID
}
