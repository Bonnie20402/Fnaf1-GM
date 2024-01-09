/// @description Insert description here
// You can write your code in this editor

enum CONFIG {
	MUSIC_VOLUME,
	MUTE_FAN_SOUND,
	USERNAME,
	JOINING_LOBBY,
	IP,
	PORT
}

ini_open("freddy.ini");

if(!ini_section_exists("config")) {
	ini_write_real("config",CONFIG.MUSIC_VOLUME,round(100));
	ini_write_real("config",CONFIG.MUTE_FAN_SOUND,false);
	ini_write_string("config",CONFIG.USERNAME,"Player");
	ini_write_string("config",CONFIG.IP,"127.0.0.1");
	ini_write_real("config",CONFIG.PORT,round(1987));
	ini_write_string("config",CONFIG.JOINING_LOBBY,"Freddy Fazbear Pizza");
	obj_notification_client.add_notification("Settings file created!");
}


global.music_volume = ini_read_real("config",CONFIG.MUSIC_VOLUME,round(100));
global.mute_fan = ini_read_real("config",CONFIG.MUTE_FAN_SOUND,false);
obj_fnafguard_client.username = ini_read_string("config",CONFIG.USERNAME,"Player");
obj_ipconfig_client.ip = ini_read_string("config",CONFIG.IP,"127.0.0.1");
obj_ipconfig_client.port = ini_read_real("config",CONFIG.PORT,round(1987));
obj_fnafguard_client.joining_lobby = ini_read_string("config",CONFIG.JOINING_LOBBY,"Freddy Fazbear PiZZA");
obj_notification_client.add_notification("Settings loaded!");

ini_close();

