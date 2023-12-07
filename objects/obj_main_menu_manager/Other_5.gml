/// @description Insert description here
// You can write your code in this editor


var _main_menu_textures = texturegroup_get_sprites("main_menu")
sprite_flush_multi(_main_menu_textures);
for(var i=0;i< array_length(_main_menu_textures); i++) {
	texture_flush(_main_menu_textures[i]);
}






