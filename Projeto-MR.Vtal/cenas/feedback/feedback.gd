extends Node2D


var feedback = Global.feedback_final
var n = 0 

# Called when the node enters the scene tree for the first time.
func _ready():
	$Transition/Fill/animation.play_backwards("transicao")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _process(delta):
	if n ==0:
		$TextureRect/pergunta.text = feedback['situ_1'][0]
		$TextureRect/resposta.text= feedback['situ_1'][2]
		$TextureRect/explicacao.text= feedback['situ_1'][1]
		$"TextureRect/pontuação".text = feedback['situ_1'][3]
	elif n == 1:
		$TextureRect/pergunta.text = feedback['situ_2'][0]
		$TextureRect/resposta.text= feedback['situ_2'][2]
		$TextureRect/explicacao.text= feedback['situ_2'][1]
		$"TextureRect/pontuação".text = feedback['situ_2'][3]
	elif n == 2:
		$TextureRect/pergunta.text = feedback['situ_3'][0]
		$TextureRect/resposta.text= feedback['situ_3'][2]
		$TextureRect/explicacao.text= feedback['situ_3'][1]
		$"TextureRect/pontuação".text = feedback['situ_3'][3]
func _on_TextureButton_pressed():
	n+=1
