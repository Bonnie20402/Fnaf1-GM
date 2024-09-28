/// 

function BonnieAnimatronicModel() : AniamtronicModel() constructor {

    start_camera = "1A";
    name = "Bonnie"
    // fuck you gml jk i ly
    _super = 0; //  used for getting the parent method reference



    _super = populate_camera_arrays;
    function populate_camera_arrays() {
        _super();
        switch (current_camera.id) {
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

        }

    }


}

//TODO continuar o bonnie e fazer ataque etc
var _x = new BonnieAnimatronicModel()
_x.current_camera = AnimatronicCameraInstances.c1A;
_x.populate_camera_arrays()

show_message("feito")