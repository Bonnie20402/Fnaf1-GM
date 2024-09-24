
if(room != rm_office) return;
var _power_message = "Power left: " + string(round(power_left.get_current_power_divided()) ) + "%\n" +
"Usage: " + string(power_left.get_current_usage(obj_core.gameplay) );

var _night_message = string
(obj_night.night_timer.current_hours()) + " AM";

_night_message+= " (" + string(obj_night.night_timer.timer) + "s)\n";


_night_message+="Night " + string(obj_night.current_night);
draw_set_font(fnt_camera_current);
draw_set_halign(fa_left);
draw_text(gui_x,gui_y,_power_message);
draw_text(gui_time_x,gui_time_y,_night_message);










