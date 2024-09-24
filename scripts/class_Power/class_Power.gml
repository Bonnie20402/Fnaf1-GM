/// 

function PowerModel() constructor {
    base_power_points = 1000;
    base_power_usage = 1;
    base_power_extra_drain_rate = 3;

    power_points = base_power_points;
    power_out = false;
    power_usage = base_power_usage;
    power_extra_drain_rate = base_power_extra_drain_rate;


    function run_power_cycle() {
        if(power_points == 0 && !power_out)  { on_power_out(); return; }

        power_points-=get_current_usage();
        power_points-=power_extra_drain_rate;
        clamp(power_points,0,1000);
        on_power_cycle();
    }


    function on_power_out() {
        power_out=true;
        return;
    }
    function update_power_extra_drain_rate(_night) {
        switch(_night) {
            case 1:
                power_extra_drain_rate = 0;
                break;
            case 2:
                power_extra_drain_rate = 6;
                break;
            case 3:
                power_extra_drain_rate = 5;
                break;
            case 4:
                power_extra_drain_rate = 4;
                break;
            case 5:
                power_extra_drain_rate = 3;
                break;
            }
        }

    /// @description Returns the current power points left, divided by 10.
    /// @returns {Real} The remaining power.
    function get_current_power_divided() {
        return power_points/10;
    }

    
    /// @description Returns current power usage
    /// @param {Struct.Gameplay} _gameplay : An reference of the gameplay constructor
    /// @returns {Int} The power usage 
    function get_current_usage(_gameplay) {
        return (_gameplay.office.left_door + _gameplay.office.right_door + 
        _gameplay.office.left_light + _gameplay.office.right_light +
        _gameplay.camera.camera_up);

    }


    /// @description Called whenever a power cycle is done (after run_power_cycle() )
    function on_power_cycle() {
        return;
    }

}