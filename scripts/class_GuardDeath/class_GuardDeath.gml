// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

enum GUARDDEATHCAUSE {
	BY_BONNIE=0,
	BY_GOLDEN=1,
	BY_FREDDY=2,
	BY_CHICA=3,
	BY_FOXY=4,
	BY_FREDDY_POWEROUT=5,
	BY_DISCONNECT=6
}


function GuardDeath(_client_id,_hours,_cause,_username) constructor {
	death_client_id = _client_id;
	//DEPRECATED
	death_hours = obj_night.current_hours;
	death_cause = _cause;
	death_username = _username;
}

