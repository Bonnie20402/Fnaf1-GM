/// 


/// @description Contains all of the game animatronic camera instances statically. Some of them are not viewable by the guard.
function AnimatronicCameraInstances() constructor {

    static c1A = new AnimatronicCameraModel("1A");
    static c1B = new AnimatronicCameraModel("1B");
    static c1C = new AnimatronicCameraModel("1C");
    static c5 = new AnimatronicCameraModel("5");
    static c7 = new AnimatronicCameraModel("7");
    static c3 = new AnimatronicCameraModel("3");
    static c6 = new AnimatronicCameraModel("6");
    static c2A = new AnimatronicCameraModel("2A");
    static c2B = new AnimatronicCameraModel("2B");
    static c4A = new AnimatronicCameraModel("4A");
    static c4B = new AnimatronicCameraModel("4B");
    static cLeftWindow = new AnimatronicCameraModel("LeftWindow");
    static cRightWindow = new AnimatronicCameraModel("RightWindow");
    static cPreAttack = new AnimatronicCameraModel("PreAttack");
    static cAttack = new AnimatronicCameraModel("Attack");
    static cAttackFail = new AnimatronicCameraModel("AttackFail");
    static cNULL = new AnimatronicCameraModel("N/A");
    
}

new AnimatronicCameraInstances()
