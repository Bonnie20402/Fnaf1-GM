/// 

enum GAMEPLAYSETTINGS_GAMEMODE {
    BATTLEROYALE=1,
    COOP=2,
    VERSUS=3
}


enum GAMEPLAYSETTINGS {
    GAMEMODE,
    ROCKSTAR_FOXY_ENABLED,
    GOLDEN_FREDDY_ENABLED,
    PAP_MODE,
    START_TIME,
    ROCKSTAR_FOXY_CHANCE_INTERVAL
}


/// Esta classe (construtor) tem como objetivo servir como a configuração do gameplay para os clientes.
function GameplaySettings() constructor {
    gamemode = GAMEPLAYSETTINGS_GAMEMODE.BATTLEROYALE;
    rockstar_foxy_enabled = true; // if RF is enabled
    golden_freddy_enabled = true; // If GF is enabled-
    pap_mode = false; // PAP mode.
    start_time = 0; // The time that the night starts, in seconds-
    rockstar_foxy_chance_interval = 15 // The interval in seconds of the rockstar foxy parrot's movement opportunity
}


function GameplaySettingsUpdate(_setting,_value) constructor {
    setting = _setting;
    value = _value;
}
