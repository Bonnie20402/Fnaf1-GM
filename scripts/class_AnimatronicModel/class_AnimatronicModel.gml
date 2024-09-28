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
    start_camera = "N/A";
    current_camera = new AnimatronicCameraModel(start_camera);
    // amount of forward cameras 8as
    forward_cameras = ["N/A"];
    // backward cameras
    backward_cameras = ["N/A"];
    
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
    /// @param {Real} _level The level to considerate.
    /// @returns {Bool} Wether the movement was successful or not.
    function move_chance(_level) {
        return ( 1 + irandom(20) <= _level )  
    }

    function shuffle_moves() {
        forward_cameras = array_shuffle(forward_cameras)
        backward_cameras = array_shuffle(backward_cameras)
        return true;
    }


    /// @description Returns wether will move forward (true) or backward (false)
    function move_direction () {
        return !( moves_backwards && 
            (backwards_chance && backward_cameras[0] != "N/A") );

    }
    /// @description Tries to move the animatronic to the designed camera.
    /// @param {Struct.AnimatronicCameraModel} _to Where to go.
    /// @returns {Bool} Wether the animatronic was able to move there or not. It
    function move(_to) {
        current_camera.remove_animatronic(self);
        if(!enhabled) return false;
        // If the camera only has this animatronic he should be able to move there again as he got stunned
        if( array_contains(_to.current_animatronics,self)) {
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
        flush_backward_cameras();
        flush_forward_cameras();
        populate_camera_arrays();

    }

     function populate_camera_arrays() {
    
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
        backward_cameras = array_create(1)
    }
    function flush_forward_cameras() {
        forward_cameras_cameras = array_create(1)
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
        attacking = false;
        attacked = false;
        current_camera = new AnimatronicCameraModel(_start);
        level = _level

    }

    function disable_animatronic() {
        enhabled = false;
    }




}




