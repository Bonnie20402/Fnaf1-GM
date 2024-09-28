/// 
global.ANIMATRONIC_FINDER = function(_element,_index) {
    return _element.name == TMP.name;
}


/// @description  A camera that has animatronics on it
/// @param {String} _id  The camera String (SOON TO BE REPLACED WITH A CAMERA OBJECT)
function AnimatronicCameraModel(_id) constructor {
    id = _id;

    //Contains the references of the animatronics
    current_animatronics = array_create(0,0);


    /// @description  Adds a AnimatronicModel into the current animatronics array.
    /// @param {Struct.AnimatronicModel} _animatronic The animatronic to add.
    function add_animatronic(_animatronic) {
        global.TMP = _animatronic;
        if(array_contains(current_animatronics,_animatronic)) {
            var _index = array_find_index(current_animatronics,global.ANIMATRONIC_FINDER);
            array_delete(current_animatronics,_index,1);
        }
        array_push(current_animatronics,_animatronic);
        return true;
    }


    /// @description  Removes a AnimatronicModel into the current animatronics array.
    /// @param {Struct.AnimatronicModel} _animatronic The animatronic to remove.
    function remove_animatronic(_animatronic) {
        global.TMP = _animatronic;
        if(array_contains(current_animatronics,_animatronic)) {
            var _index = array_find_index(current_animatronics,global.ANIMATRONIC_FINDER);
            array_delete(current_animatronics,_index,1);
            return true;
        }
        return false;
    }
}