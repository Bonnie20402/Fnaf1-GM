/// @description Insert description here
// You can write your code in this editor


save = function() {
	ini_open("freddy.ini");
	ini_write_real("config",CONFIG.MUSIC_VOLUME,global.music_volume);
	ini_write_real("config",CONFIG.MUTE_FAN_SOUND,global.mute_fan);
	ini_write_string("config",CONFIG.USERNAME,obj_fnafguard_client.username);
	ini_write_string("config",CONFIG.IP,obj_ipconfig_client.ip);
	ini_write_real("config",CONFIG.PORT,obj_ipconfig_client.port);
	ini_close();
	obj_notification_client.add_notification("Settings saved!");
};

