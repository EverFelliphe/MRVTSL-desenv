extends CanvasLayer

func _ready():
	pass # Replace with function body.

func _on_TextureButton_button_down():
	$ColorRect.show()
	$ColorRect/AnimationPlayer.play_backwards("options")
	 # Replace with function body.
	$TextureButton/Timer.start()

func _on_Timer_timeout():
	$TextureButton.hide()
	

func _on_cdigo_vtal_pressed():
	pass # Replace with function body.


func _on_CheckBox_pressed():
	if OS.window_fullscreen:
		OS.window_fullscreen = !OS.window_fullscreen
	else: OS.window_fullscreen =true


func _on_resume_pressed():
	$hide.start()


func _on_menu_pressed():
	get_tree().change_scene("res://cenas/menu/Menu.tscn")


func _on_hide_timeout():
	$TextureButton.show()
	$ColorRect/AnimationPlayer.play("options")
