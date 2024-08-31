/// @description Insert description here
// You can write your code in this editor


gameplay = new Gameplay();

gameplay.can_scroll = true;


flush = function() {
	gameplay = new Gameplay();
	gameplay.can_scroll = true;
}


send_to_server = function() {
	var _json = json_stringify(gameplay,true);
	

}







