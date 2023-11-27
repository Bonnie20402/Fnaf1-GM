
warning_msg = string_concat(
"WARNING\n" +
"This game contains jumpscares\n" +
"You have been warned!\n" +
"Made with love in GameMaker"
);
draw_set_color(c_white)
draw_set_font(fnt_warning)
draw_set_halign(fa_center)
audio_play_sound(snd_beep,0,0);
alarm_set(0,0.8*game_get_speed(gamespeed_fps));

