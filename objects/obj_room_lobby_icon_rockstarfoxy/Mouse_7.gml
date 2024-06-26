/// @description Insert description here

if (obj_lobby_client.lobby_master == obj_fnafguard_client.client_id) {
    // Debugging: Check if lobby_gameplay_settings exists and rockstar_foxy_enabled is accessible
    if (obj_lobby_client.lobby_gameplay_settings != undefined) {
        show_message("lobby_gameplay_settings exists");

        var _toggle = !obj_lobby_client.lobby_gameplay_settings.rockstar_foxy_enabled;
        show_message("Current rockstar_foxy_enabled: " + string(obj_lobby_client.lobby_gameplay_settings.rockstar_foxy_enabled));
        show_message("Toggled rockstar_foxy_enabled: " + string(_toggle));

        var _settings_update = new GameplaySettingsUpdate(GAMEPLAYSETTINGS.ROCKSTAR_FOXY_ENABLED, _toggle);
        buffer_fnaf_create_and_send(obj_fnafguard_client.server_connection, FNAFMESSAGE_FROM_CLIENT.LOBBY_GAMEPLAYSETTINGS_UPDATE, json_stringify(_settings_update));
    } else {
        show_message("lobby_gameplay_settings is undefined");
    }
} else {
    audio_play_sound(snd_error, 0, false);
}
