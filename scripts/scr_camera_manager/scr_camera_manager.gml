



















/*
	DEBUG FUNCTIONS
						*/
						
///@desc DEPRECTATED
function scr_toggle_camera_buttons_visibility() {
	for( var _i =0; _i < instance_number(obj_camera_button);_i++ )  {
		var _inst = instance_find(obj_camera_button,_i);
		_inst.visible = !_inst.visible;
	}
}

function scr_disable_camera_buttons() {
		for( var _i =0; _i < instance_number(obj_camera_button);_i++ )  {
			var _inst = instance_find(obj_camera_button,_i);
			_inst.active = false;
	}
}