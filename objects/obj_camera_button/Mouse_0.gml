/// @description Insert description here
// You can write your code in this editor
// if not open go away
if(!obj_office.camera_up || obj_hitbox_camera.camera_lock) return;

//if open and current camera is camera go away too 
if (obj_office.camera_up && !obj_hitbox_camera.camera_lock && obj_office.current_camera == self.camera_button) return;


//set camera code
image_index = 1; // put the frame into the "activared" thing
obj_office.current_camera = self.camera_button; // update office cam variable
obj_camera_string.set_camera_current_string(self.camera_text); // update current camera string




