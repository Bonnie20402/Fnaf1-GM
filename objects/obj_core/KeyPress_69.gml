/// @description Insert description here
// You can write your code in this editor

bonnie.shuffle_moves()


bonnie.move(bonnie.move_direction() ? bonnie.forward_cameras[0] : bonnie.backward_cameras[0]);
bonnie.populate_camera_arrays();

show_message(string(bonnie));