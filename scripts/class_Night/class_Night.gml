
function NightTimerModel() constructor {
    timer = 0;
    timer_finish = 340
    seconds_per_hour = 90

    function current_hours() {
        var _output = round(timer/seconds_per_hour);
        return _output == 0 ? 12 : _output;
    }
    function on_hour_update() {
        return;
    }
    function on_clock_update(_oldhours,_newhours) {
        if(_oldhours != _newhours) on_hour_update();
        return;
    }
    function run_clock() {
        var _oldhours = current_hours();
        timer++;
        var _newhours = current_hours();
        on_clock_update(_oldhours,_newhours);
        return;
    }


}