// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function LobbyJoin(_clientid,_clientname) constructor{
	lobbyjoin_clientid = _clientid;
	lobbyjoin_username = _clientname;
}

function LobbyQuit(_clientid,_clientname) constructor{
	lobbyquit_clientid = _clientid;
	lobbyquit_username = _clientname;
}