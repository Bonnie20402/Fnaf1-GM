
/// 

function CameraModel() constructor {
    camera_up = false;
    current_camera = "1A";
    camera_disabled = false;

    function init() {
        camera_button_1a.set_camera_button("1A");
        camera_button_1a.set_camera_text("Show Stage");
        camera_button_1b.set_camera_button("1B");
        camera_button_1b.set_camera_text("Dinning Area");
        camera_button_1c.set_camera_button("1C");
        camera_button_1c.set_camera_text("Pirate's Cove");
        camera_button_2a.set_camera_button("2A");
        camera_button_2a.set_camera_text("West Hall");
        camera_button_2b.set_camera_button("2B");
        camera_button_2b.set_camera_text("West Hall Corner");
        camera_button_4a.set_camera_button("4A");
        camera_button_4a.set_camera_text("Ana's Hall");
        camera_button_4b.set_camera_button("4B");
        camera_button_4b.set_camera_text("East Hall Corner");
        camera_button_3.set_camera_button("3");
        camera_button_3.set_camera_text("Erico's Closet");
        camera_button_5.set_camera_button("5");
        camera_button_5.set_camera_text("Yasmin's Backstage");
        camera_button_7.set_camera_button("7");
        camera_button_7.set_camera_text("Restroom");
        camera_button_6.set_camera_button("6");
        camera_button_6.set_camera_text("Lara's Kitchen");
        
        obj_camera_string.set_camera_current_string("Show Stage");
        obj_camera_current_spr.update_current_camera_sprite();
    }

    function on_open_start(){
        audio_sound_gain(snd_fan,0.3,250);
        audio_play_sound(snd_camera_up,0,false);
    }

    

    function on_open_finish() {
        obj_night.update_power_usage();
        audio_play_sound(snd_blop,0,false);
        view_visible[0] = false;
        obj_camera_current_spr.update_current_camera_sprite()
        view_visible[1] = true;
        obj_camera_hud._camera_change_effect_frame = 0;
        if(obj_night.current_power == 0) scr_camera_force_down();
        
    }
    function on_close_start() {
        view_visible[0] = true;
        view_visible[1] = false;
        
        audio_sound_gain(snd_fan,0.8,250);
        audio_play_sound(snd_camera_down,0,false);
        audio_stop_sound(snd_camera_up);
        stop_disable_sound();
        if(obj_ai_bonnie.current_camera == "Attack")  {
            obj_ai_bonnie.current_camera = "AttackSuccess";
            obj_ai_bonnie.on_animatronic_move();
            obj_ai_bonnie.on_animatronic_attack();
        }
        else if(obj_ai_chica.current_camera == "Attack") {
            obj_ai_chica.current_camera = "AttackSuccess";
            obj_ai_chica.on_animatronic_move();
            obj_ai_chica.on_animatronic_attack();
        }
    
        //Foxy has a countdown time that's supposed to prevent him from moving until about 1-17.5 seconds after the monitor is put down
        if(obj_ai_foxy.current_camera != "2A")obj_ai_foxy.camera_down_time = random_range(1,17.5);
    }
    function on_close_finish() {
        obj_night.update_power_usage();
    }

    function on_change_start() {
        obj_camera_hud._camera_change_effect_frame = 0;
        obj_camera_current_spr.update_current_camera_sprite();
        audio_play_sound(snd_blop,0,0);
    }

    function on_change_finish() {
        return;
    }



    function force_down() {
        //prevent infinite loop
        if(obj_hitbox_camera.camera_lock) return;
        if(!obj_hitbox_camera.camera_lock)obj_hitbox_camera.camera_lock = true;
    }

    function force_up() {
        //prevent infinite loop
        if(obj_hitbox_camera.camera_lock) return;
        
        if(!obj_hitbox_camera.camera_lock)obj_hitbox_camera.camera_lock = true;
    }

    function is_camera_up() {
        return !obj_hitbox_camera.camera_lock;
    }
    function play_disable_sound() {
        var _sound = irandom(2);
        switch(_sound) {
            case 0:
                audio_play_sound(snd_camera_disable0,0,false,1);
                break;
            case 1:
                audio_play_sound(snd_camera_disable1,0,false,1);
                break;
            case 2:
                audio_play_sound(snd_camera_disable2,0,false,1);
                break;
        }
    }
    function stop_disable_sound() {
        audio_stop_sound(snd_camera_disable0);
        audio_stop_sound(snd_camera_disable1);
        audio_stop_sound(snd_camera_disable2);
    }
    

}