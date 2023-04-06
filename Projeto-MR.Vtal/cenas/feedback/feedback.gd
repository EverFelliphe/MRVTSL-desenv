extends Node2D


var feedback = Global.feedback_final
var n = 0 

# Called when the node enters the scene tree for the first time.
func _ready():
	$Transition/Fill/animation.play_backwards("transicao")
	$ColorRect/Label.set_position(Vector2(85,39))

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _process(delta):
	if n ==1:
		
		$TextureRect/pergunta.text = feedback['situ_1'][0]
		$TextureRect/resposta.text= "A sua resposta nesta situação foi :" + feedback['situ_1'][1]
		$TextureRect/explicacao.text= feedback['situ_1'][2]
		$"TextureRect/pontuação".text = "A sua pontuação nesta situação foi de :" + str(feedback['situ_1'][3])
		$ColorRect.hide()
	elif n == 2:
		$TextureRect.texture = load("res://imagens/feedback/TelaFinalSitu2.png")
		$TextureRect/pergunta.text = feedback['situ_2'][0]
		$TextureRect/resposta.text= "A sua resposta nesta situação foi :" + feedback['situ_2'][1]
		$TextureRect/explicacao.text= feedback['situ_2'][2]
		$"TextureRect/pontuação".text = "A sua pontuação nesta situação foi de :" + str(feedback['situ_2'][3])
	elif n == 3:
		$TextureRect.texture = load("res://imagens/feedback/TelaFinalSitu3.png")
		$TextureRect/pergunta.text = feedback['situ_3'][0]
		$TextureRect/resposta.text= "A sua resposta nesta situação foi :" + feedback['situ_3'][1]
		$TextureRect/explicacao.text= feedback['situ_3'][2]
		$"TextureRect/pontuação".text = "A sua pontuação nesta situação foi de :" + str(feedback['situ_3'][3])
	elif n == 4:
		$ColorRect/Label.text = "Para saber mais sobre o código de ética da V.tal clique no botão abaixo."
		$"ColorRect/código_vtal".show()
		
		$ColorRect.show()
	elif n == 5:
		$"ColorRect/código_vtal".hide()
		$ColorRect/Label.hide()
		$ColorRect/Label3.show()
		$CanvasLayer/TextureButton.hide()
		$ColorRect/Label2.show()
		$ColorRect/HBoxContainer.show()
		
		
func _on_TextureButton_pressed():
	print("tt")
	n+=1


func _on_cdigo_vtal_pressed():
	pass # Replace with function body.


func _on_Sair_pressed():
	get_tree().quit()


func _on_menu_pressed():
	get_tree().change_scene("res://cenas/menu/Menu.tscn")


func _on_mapa_pressed():
	get_tree().change_scene("res://cenas/mapa_principal/mapa_principal.tscn")
