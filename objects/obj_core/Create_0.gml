/// @description Represents the core of  the game. This is where everything comes from.
// You can write your code in this editor


gameplay = new Gameplay();
bonnie = new BonnieAnimatronicModel();

gameplay.can_scroll = true;


flush = function() {
	gameplay = new Gameplay();
	gameplay.can_scroll = true;
}


send_to_server = function() {
	var _json = json_stringify(gameplay,true);
	

}







