extends Node2D

var n = 1
var dialogo = Global.falas['fabricio'] #chama o dicionario global contendo os dialogos e armazena em uma variavel local
var limite = len(dialogo)  #define até onde o diálogo vai, para que, após terminar, mude de cena
#neste caso chama a seção do fabrício
func _ready():
	$caixa/texto.text = dialogo[0]
	$Transition.hide()
	$Transition2/Fill/animation.play_backwards("transicao")
	$Transition2.timer()
#ao iniciar define o $caixa/texto com base no indice do dicionario
func _on_pular_pressed():
	if n == limite:
		$Transition.show()
		$Transition/Fill/animation.play("transicao")
		$Timer.start()
		#muda de cena após acabar o diálogo
	else:
		$caixa/texto.text = dialogo[n]  #muda o $caixa/texto de acordo com a seção do dicionario definido nas variaveis globais
		n += 1
	
func _on_Timer_timeout(): #muda a cena para o mapa principal quando acaba o timer 
	get_tree().change_scene("res://cenas/mapa_principal/mapa_principal.tscn")
	
