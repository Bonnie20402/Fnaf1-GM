/// @description Insert description here
// You can write your code in this editor
var _debug_message = "AI Enabled: " + string(use_ai) + "\n" +
                    "AI Level: " + string(ai_level) + "\n" +
                    "AI Chance Time: " + string(ai_chance_time) + "\n" +
					"Current cam:" + string(current_camera) + "\n" +
					"Forward:" + string(obj_ai_foxy.forward_cameras) + "\n" +
					"Camera Down Timer:" + string(obj_ai_foxy.camera_down_time) + "s";
draw_set_font(fnt_camera_button);
draw_text(600, 10, _debug_message);



