/// 

 function AniamtronicModel () constructor {


    name = "Basic Animatronic";
    level = 20;
    ai_move_timer = 3.42;
    jumpscare_time = 0.8;
    enabled = false;
    attacking = false;
    attacked = false;
    //Wether this animatronic moves to a camera that alrready has an animatronic in it.
    overlaps_animatronics = false;
    moves_backwards = false;
    start_camera = AnimatronicCameraInstances.cNULL;
    current_camera = AnimatronicCameraInstances.cNULL;
    // amount of forward cameras 8as
    forward_cameras = array_create(1);
    // backward cameras
    backward_cameras = array_create(1);
    
    // the move timer of the animatronic
 

    //the chance of when having a sucessful move chance, going backwards instead. THIS SHOULD NOT HAPPEN IF THE ANIMATRONIC IS CURRENTLY ATTACKING
    backwards_chance = 0.15;


    #region Counters
    // the amount of times the animatronic has been stunned (Missed a movement opportunity due to RNG or due to some ass bbeing in the way)
    stun_counter = 0;
     // the amount of successfull forward movement oportunities
    move_forward_counter = 0;
    // the amount of successfull backward movement oportunities
    move_backward_counter = 0;
    // the amount of successfull  movement oportunities
    move_counter = move_forward_counter + move_backward_counter;

    //Values for all the animatronics
    static global_attack_counter = 0;
    static global_stun_counter = 0;
    static global_move_forward_counter = 0;
    static global_move_backward_counter = 0;
    static global_move_counter = 0;
    #endregion


    // the amount of times the aniamtronic tried to attack the Player
    attack_counter = 0;
    



    /// @description Tries to get a sucessful movement opportunity
    /// @returns {Bool} Wether the movement was successful or not.
    function move_chance() {
        return ( 1 + irandom(20) <= level )  
    }

    function shuffle_moves() {
        forward_cameras = array_shuffle(forward_cameras)
        backward_cameras = array_shuffle(backward_cameras)
        return true;
    }


    /// @description Returns wether will move forward (true) or backward (false)
    function move_direction () {
        return !( moves_backwards && 
            (backwards_chance && backward_cameras[0] != AnimatronicCameraInstances.cNULL) );

    }
    /// @description Tries to move the animatronic to the designed camera.
    /// @param {Struct.AnimatronicCameraModel} _to Where to go.
    /// @returns {Bool} Wether the animatronic was able to move there or not. It
    function move(_to) {
        current_camera.remove_animatronic(self);
        show_message("Moving to " + _to.camid);
        if(!enhabled) return false;

        // Check if it's trying to  attack
        if(_to == AnimatronicCameraInstances.cPreAttack) on_pre_attack();

        //check if it's attacking
        if(_to == AnimatronicCameraInstances.cAttack) try_to_attack();

        
        // Increase the counters
        if(array_contains(backward_cameras,_to)) on_backward_move();
        else if (array_contains(forward_cameras,_to)) on_forward_move();
        // If the camera only has this animatronic he should be able to move there again as he got stunned
        if( current_camera == _to) {
            on_stun();
            _to.add_animatronic(self);
            current_camera = _to;
            return true;
        }
        //IF the camera is empty move their ass
        else if ( array_length(_to.current_animatronics) == 0 ) {
            _to.add_animatronic(self);
            current_camera = _to;
            return true;
        }
        // if this animatronic overlaps other ones, also move their ass
        else if (overlaps_animatronics) {
            _to.add_animatronic(self);
            current_camera = _to;
            return true;
        }
        return false;
        
    }

    function on_move_complete() {

        populate_camera_arrays();

        attacking = current_camera == AnimatronicCameraInstances.cPreAttach;
        attacked = current_camera == AnimatronicCameraInstances.cAttack;

    }

    /// @description  Populates the ``forward_cameras`` and ``backward_cameras`` arrays depending on the current value of the ``current_camera`` variable. This method is supposed to be overriden
     function populate_camera_arrays() {
        flush_backward_cameras();
        flush_forward_cameras();
        return;
    }

    /// @description  Adds a AnimatronicCameraModel into the forward cameras array.
    /// @param {Struct.AnimatronicCameraModel} _camera The camera to add.
    function add_forward_camera(_camera) {
        array_push(forward_cameras,_camera);
        if(array_get_index(forward_cameras,0) != -1) {
            var _index = array_get_index(forward_cameras,0);
            array_delete(forward_cameras,_index,1);
        }
    }
    
    /// @description  Adds a AnimatronicCameraModel into the backward cameras array.
    /// @param {Struct.AnimatronicCameraModel} _camera The camera to add.
    function add_backward_camera(_camera) {
        array_push(backward_cameras,_camera);
        if(array_get_index(backward_cameras,0) != -1) {
            var _index = array_get_index(backward_cameras,0);
            array_delete(backward_cameras,_index,1);
        }
    }


    function flush_backward_cameras() {
        if(array_contains(backward_cameras, instanceof(AnimatronicCameraModel)) ) {
            array_foreach(backward_cameras,function(_element,_index) {
                _element.remove_animatronic(self);
            })
        }

        backward_cameras = array_create(1)
    }
    function flush_forward_cameras() {
        if(array_contains(forward_cameras, instanceof(AnimatronicCameraModel)) ) {
            array_foreach(forward_cameras,function(_element,_index) {
                _element.remove_animatronic(self);
            })
        }
        forward_cameras = array_create(1)
    }


    function on_stun() {
        stun_counter++;
        global_stun_counter++;
    }

    function on_forward_move() {
        move_forward_counter++;
        global_move_forward_counter++;
        global_move_counter++;

    }
    function on_backward_move() {
        move_backward_counter++;
        global_move_backward_counter++;
        global_move_counter++;
    }


    /// @description Called when to enable the animatronic AI.
    /// @param {Real} _level The AI level
    /// @param {Struct.AnimatronicCameraModel} _start 
    function enable_animatronic(_level,_start) {
        enhabled = true;
        current_camera = _start;
        level = _level
        populate_camera_arrays();

    }


    /// @description  Called when the animatronic starts an attack (e.g the next successful move will fuck the guard up)
    function on_pre_attack(){
        global_attack_counter++;
        attack_counter++;
        return;
    }
    /// @description  Called after PreAttack. Should have the logic of this animatronic's attack conditions and forward to attack_success or attack_miss
    function try_to_attack() {
        attacking = false;
        global_attack_counter++;
    
    }

    /// @description  Called whenever a successful attack was made. Contains the logic to kill the guard and shit.
    function on_attack_success() {
        attacked=true;
        return
    }
    /// @description Called whenever a attack has been missed. Should contain the logic to move ass back to initial position or smth
    function on_attack_miss() {
        attacking=false;
        attacked=false;
        return;
    }
    function disable_animatronic() {
        enhabled = false;
    }


    function toString() {

        return name + " Level[" + string(level) + "/20]" + "\n" +
            "Current: " + current_camera.camid + "\n" + // Added "Start: " if needed
            (moves_backwards ? "Moves backwards" : "Doesn't move backwards") + "\n"  +
            "Forward: " + string(forward_cameras) + "\n" +
            "Backward: " + string(backward_cameras) + "\n" +
            "Chance Timer: " + string(ai_move_timer) + 
            " Stuns: " + string(stun_counter) + " (" + string(global_stun_counter) + ")" + "\n" +
            "FRD Count.: " + string(move_forward_counter) + " (" + string(global_move_forward_counter) + ")" + "\n" +
            "BRD Count.: " + string(move_backward_counter) + " (" + string(global_move_backward_counter) + ")" + "\n";
    }
}




