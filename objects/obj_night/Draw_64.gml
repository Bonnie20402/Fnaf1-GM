
if(room != rm_office || !obj_night.run_night) return;
var _power_message = "Power left: " + string(obj_night.current_power/10) + "%\n" +
"Usage: " + string(obj_night.current_power_usage);

var _night_message = string(obj_night.current_hours) + " AM\nNight " + string(obj_night.current_night);
draw_set_font(fnt_camera_current);
draw_set_halign(fa_left);
draw_text(gui_x,gui_y,_power_message);
draw_text(gui_time_x,gui_time_y,_night_message);










