/// @description Manual draw buttons
// You can write your code in this editor
if(!obj_core_gameplay.gameplay.camera_up || obj_hitbox_camera.camera_lock) return;

draw_set_font(fnt_camera_button);
draw_set_halign(fa_left);
draw_sprite(spr_office_camera_button,self.camera_button_frame_on ? 1 : 0,initial_x,initial_y);
draw_text(initial_x + 5 ,initial_y + 5,"CAM \n"+self.camera_button + "\n");



