/// @description Insert description here
// You can write your code in this editor
if(!global.debug) return;
var _debug_message = "AI Enabled: " + string(use_ai) + "\n" +
                    "AI Level: " + string(ai_level) + "\n" +
                    "AI Chance Time: " + string(ai_chance_time) + "\n" +
					"Current cam:" + string(current_camera) + "\n" +
					"Forward:" + string(obj_ai_bonnie.forward_cameras) + "\n" +
					"Backward:" + string(obj_ai_bonnie.backward_cameras);
draw_set_font(fnt_camera_button);
draw_text(10, 10, _debug_message);



