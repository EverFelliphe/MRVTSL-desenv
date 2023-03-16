extends Node2D
onready var nivel_imag = $VBoxContainer/nivel

func _ready(): #mostra a pontuação zerada ao iniciar o jogo
	$VBoxContainer/pont_0.show()
	
func _process(delta): #atualiza a hud a medida que ganha pontuação
	if Global.pontuacao == 4: #se subir de nivel, atualiza a moldura 
		$VBoxContainer/nome_nivel.texture = load("res://imagens/níveis/MolduraDuquePronta.png")
	if Global.pontuacao == 1:
		$Timer.start()
		$VBoxContainer/pont_1.show()
		$VBoxContainer/pont_2.hide()
		$VBoxContainer/pont_0.hide()
		$VBoxContainer/pont3.hide()
		$VBoxContainer/pont_4.hide()
		
	elif Global.pontuacao == 2:
		$VBoxContainer/pont_2.show()
		$VBoxContainer/pont_1.hide()
		$VBoxContainer/pont_0.hide()
		$VBoxContainer/pont3.hide()
		$VBoxContainer/pont_4.hide()
		
	elif Global.pontuacao == 3:
		$VBoxContainer/pont3.show()
		$VBoxContainer/pont_2.hide()
		$VBoxContainer/pont_1.hide()
		$VBoxContainer/pont_0.hide()
		$VBoxContainer/pont_4.hide()
		
	elif Global.pontuacao == 4  :
		$VBoxContainer/pont_1.hide()
		$VBoxContainer/pont_0.hide()
		$VBoxContainer/pont3.hide()	
		$VBoxContainer/pont_2.hide()
		$VBoxContainer/pont_4.show()
		$Timer.start()
	elif Global.pontuacao == 0 or Global.pontuacao <=0:
		$VBoxContainer/pont_4.hide()
		$VBoxContainer/pont_0.show()
		$VBoxContainer/pont_1.hide()
		$VBoxContainer/pont3.hide()
		$VBoxContainer/pont_2.hide()
	
		
func _on_Timer_timeout(): #mostra a hud nova quando tiver 4 pontos ou pontos negativos
	if Global.pontuacao == 4: #se subir de nivel, atualiza a moldura 
		$VBoxContainer/nome_nivel.texture = load("res://imagens/níveis/MolduraDuquePronta.png")
	$VBoxContainer/pont_4.hide()
	$VBoxContainer/pont_0.show()
	$VBoxContainer/pont_1.hide()
	$VBoxContainer/pont3.hide()
	$VBoxContainer/pont_2.hide()
