/// @description Insert description here
// You can write your code in this editor


sprite_index = spr_redacted_itsme0;

depth = obj_office.depth-50;
visible = false
now_hallucinating = false;
hallucinate_timer = 3.42
blink_chance = 0.6;
current_blinks = 0;
max_blinks = 64;
text = "";
hallucinate_chance = 1;

hallucinate_min = 0.33;
hallucinate_max = 0.66;



function generate_setence() {
	switch(irandom(19))  {
		case 1:
			text = "Acabem com o meu sofrimento de uma vez!";
			break;
		case 2:
			text = "Coto, ajuda-me por favor!";
			break;
		case 3:
			text = "Estou mesmo a apresentar isto a frente de todos?!?!?!";
			break;
		case 4:
			text = "Parabens pelos 17 anos, Pedro Lameira!";
			break;
		case 5:
			text = "Obrigado pela tua ajuda, Lara!";
			break;
		case 6:
			text = "Stor, sofri muito para fazer este jogo!";
			break;
		case 7:
			text = "Ana, vamos andar de trotinete?";
			break;
		case 8:
			text = "Erico, obrigado por me introduzires ao Game Maker!";
			break;
		case 9:
			text = "Vou ter saudades de toda a gente!"
			break;
		case 10:
			text = "RIP Pedrinho o gato, nunca te esqueceremos!"
			break;
		case 11:
			text = "SIM SIM SIM SIM SIM SIM";
			break;
		case 12:
			text = "Adoro-te, Coto!";
			break;
		case 13:
			text = "Adoro-te, Manuel!";
			break;
		case 14:
			text = "O Coto e um excelente porteiro da sala!";
			break;
		case 15:
			text = "Sala 308 aberta!";
			break;
		case 16:
			text = "Sala 308 fechada!";
			break;
		case 17:
			text = "Adoro-te, Ana!";
			break;
		case 18:
			text = "Adoro-te, Lara!";
			break;
		case 19:
			text = "Yasmin boa sorte na tua terapia tu consegues <3";
			text += "\nTens todo o meu apoio!";
			break;
	}
}

function start_hallucinating() {
	if(now_hallucinating)return;
	alarm_set(0,0.1*game_get_speed(gamespeed_fps));
}