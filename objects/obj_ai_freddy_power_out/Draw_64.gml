/// @description Insert description here
// You can write your code in this editor

if(!global.debug) return;
var _debug_message = "Freddy Power out\n" +
                    "Phase: " + string(obj_ai_freddy_power_out.current_phase) + "\n" +
                    "Misses: " + string(obj_ai_freddy_power_out.misses);
draw_set_font(fnt_camera_button);
draw_text(400, 200, _debug_message);










