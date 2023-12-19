
if(room != rm_office) return;
var _power_message = "Power left: " + string(obj_night.current_power/10) + "%\n" +
"Usage: " + string(obj_night.current_power_usage);

var _night_message = string(obj_night.current_hours) + " AM\n";
if(obj_fnafguard_client.is_spectating) _night_message += "SPECTATING";
else _night_message+="Night " + string(obj_night.current_night);
draw_set_font(fnt_camera_current);
draw_set_halign(fa_left);
draw_text(gui_x,gui_y,_power_message);
draw_text(gui_time_x,gui_time_y,_night_message);










