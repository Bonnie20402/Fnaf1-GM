//@function onPlushCollect(_plushieid)
//@param {instanceID} _plushieid  The object to destroy.
//@param {instanceID} _cesto_instance_id  The object that destroyed the plushie.
// @description Should be called whenever cesto and plushie collide.
function on_plush_collect(_plushieid){
	instance_destroy(_plushieid);
	audio_play_sound(snd_beep,0,0);
}



function frase_secreta(_cesto_id) {
	var _frases_secretas = [
	"Erico seu gay",
	"Eu gosto do game maker :)",
	"Esta merda é facil até",
	"arroz feijao e batata, oque falta?"
	]
	
	// mudar semente do rng
	_cesto_id.uimsg_texto_score = _frases_secretas[irandom(array_length(_frases_secretas))-1]
}