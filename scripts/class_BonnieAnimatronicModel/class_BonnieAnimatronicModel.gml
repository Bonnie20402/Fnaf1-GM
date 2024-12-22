/// 

function BonnieAnimatronicModel() : AniamtronicModel() constructor {
    _super = 0; //  used for getting the parent method reference
    start_camera = AnimatronicCameraInstances.c1A;
    name = "Bonnie"
    ai_move_timer = 4.97;
    backwards_chance = 0.15;
    moves_backwards = true;



    _superA = populate_camera_arrays;
    function populate_camera_arrays() {
        _superA(); 
        switch (current_camera.camid) {
            case "1A":
                add_forward_camera(AnimatronicCameraInstances.c1B);
                add_forward_camera(AnimatronicCameraInstances.c5);
                add_backward_camera(AnimatronicCameraInstances.cNULL);
                break;
            case "1B":
                add_forward_camera(AnimatronicCameraInstances.c5);
                add_forward_camera(AnimatronicCameraInstances.c3);
                add_forward_camera(AnimatronicCameraInstances.c2A);
                add_backward_camera(AnimatronicCameraInstances.cNULL);
                break;
            case "5":
                add_forward_camera(AnimatronicCameraInstances.c2A);
                add_forward_camera(AnimatronicCameraInstances.c3);
                add_backward_camera(AnimatronicCameraInstances.c1B);
                add_backward_camera(AnimatronicCameraInstances.c3);
                break;
            case "3":
                add_forward_camera(AnimatronicCameraInstances.c2B);
                add_forward_camera(AnimatronicCameraInstances.c2A);
                add_forward_camera(AnimatronicCameraInstances.cPreAttack);
                add_backward_camera(AnimatronicCameraInstances.c1B);
                add_backward_camera(AnimatronicCameraInstances.c3);
                break;
            case "2A":
                add_forward_camera(AnimatronicCameraInstances.c2B);
                add_forward_camera(AnimatronicCameraInstances.cPreAttack);
                add_backward_camera(AnimatronicCameraInstances.c3);
                add_backward_camera(AnimatronicCameraInstances.c1B);
                add_backward_camera(AnimatronicCameraInstances.c3);
                add_backward_camera(AnimatronicCameraInstances.c5);
                break;
            case "2B":
                add_forward_camera(AnimatronicCameraInstances.cLeftWindow);
                add_backward_camera(AnimatronicCameraInstances.c2A);
                add_backward_camera(AnimatronicCameraInstances.c3);
                add_backward_camera(AnimatronicCameraInstances.c1B);
                add_backward_camera(AnimatronicCameraInstances.c5);
                break;
            case "PreAttack": // Staring at left window
                add_forward_camera(AnimatronicCameraInstances.cAttack);
                add_backward_camera(AnimatronicCameraInstances.cNULL);
                break;
            case "Attack": // The left panel has been blocked. Next time the guard opens the camera, bonnie attacks.
                add_forward_camera(AnimatronicCameraInstances.cAttack);    
                add_backward_camera(AnimatronicCameraInstances.cNULL);
                break;
            case "AttackFail": // We missed a attack.
                add_forward_camera(AnimatronicCameraInstances.c1B);
                add_forward_camera(AnimatronicCameraInstances.c3);
                add_backward_camera(AnimatronicCameraInstances.cNULL);
                break;

        }
    }

    _superB = try_to_attack
    function try_to_attack() {
        _superB();
        if(obj_core.gameplay.office.left_door) on_attack_miss();
		else on_attack_success();
    }

    _superC = on_attack_miss;
    function on_attack_miss() {
        _superC();
        shuffle_moves();
        current_camera = forward_cameras[0];
        move(forward_cameras[0]);
        on_move_complete();
    }

    _superD = on_attack_success;
    function on_attack_success() {
        _superD();
        //TODO: Put jumpscare logic in here.
    }
}