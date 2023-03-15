extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.

func _on_TextureButton_pressed():
	Global.controle_nathalia = true
	$Sprite/TextureButton/AnimationPlayer.play_backwards("slide")
	



func _on_Quest_timeout():
	$descida.start()	


func _on_descida_timeout():
	$Sprite/TextureButton/AnimationPlayer.play("slide")
	$pisca.start()


func _on_pisca_timeout():
	$Sprite/TextureButton/AnimationPlayer.play("call")
	
