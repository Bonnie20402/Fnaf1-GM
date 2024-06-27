/// @description Insert description here

if (obj_lobby_client.lobby_master == obj_fnafguard_client.client_id) {
    if (obj_lobby_client.lobby_gameplay_settings != undefined) {
        var _toggle = !obj_lobby_client.lobby_gameplay_settings.rockstar_foxy_enabled;
        var _settings_update = new GameplaySettingsUpdate(GAMEPLAYSETTINGS.ROCKSTAR_FOXY_ENABLED, _toggle);
        buffer_fnaf_create_and_send(obj_fnafguard_client.server_connection, FNAFMESSAGE_FROM_CLIENT.LOBBY_GAMEPLAYSETTINGS_UPDATE, json_stringify(_settings_update));
    }
} else {
    audio_play_sound(snd_error, 0, false);
}
