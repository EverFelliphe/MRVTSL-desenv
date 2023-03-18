extends Node2D

var dialogo = Global.falas["nathalia"] #carrega falas da nathalia 
var n = Global.nthalia_index #controle de falas, indíce do dicionário 
var controle = Global.controle_nathalia #controla se está no diálogo da nathalia, dicionário nathalia 
var nivel_2 = Global.nivel_2#verifica se o player passou de nível para iniciar a cutscene 
var current_state = Global.current_state

func _ready(): 
	Global.camera_state = Global.StateCameraClamp.Off
	$Personagem.position = Vector2(Global.posicaox , Global.posicaoy) 
	$dialogo.hide() #esconde dialogo e falas durante início da cena 
	$CanvasLayer.hide()
	match current_state: #primeira abertura do jogo inicia dialogo com nathalia  
		Global.State.Inicio:
			Global.controle_nathalia = false
			$sec_mission.hide()
			$hud.hide()
			$dialogo.hide()
			$Transition/Fill/animation.play_backwards("transicao")
			$Timer4.start()
			$mini_game_1/poste.set_disabled(true)
	#		Global.nivel_1 = true
	#		Global.pontuacao = 0
	 #quando ele voltar da situação ele esconde a exclamação, atualiza a posição do personagem e apaga o dialogo inicial
		Global.State.Situacao1:
			pass
			
		Global.State.Situacao1_finish:
			$Situacao.queue_free()
			$excl.queue_free()
			$sec_mission.show()
			
		Global.State.Situacao2:
			#após dialogo o personagem fica na posição inicial 
			$mini_game_1.queue_free()
			$excl.hide()
			$sec_mission.show()
			$sec_mission.play()
			$Quest.start()
			$sec_mission.show()
	
#	if Global.pontuacao == 4 :
#		$nivel_1.start()

func _process(delta):

	if Global.controle_nathalia == true:
			$hud.show()
			$dialogo/Dialogo/texto.text = dialogo[Global.nthalia_index]
			Global.velocity(0)
			$dialogo.show()
			Global.controle_nathalia  = false
<<<<<<< Updated upstream
	
	match Global.current_nivel:
		Global.state_nivel.N1:
			$nivel_1.start()
		
=======
	if Global.pontuacao == 4 :

		$nivel_1.start()
		Global.pontuacao = 0
>>>>>>> Stashed changes
		
func _on_Situacao_body_entered(body): #inicia animação nathalia e começa o timer da cena 
	$CanvasLayer.show()
	esconder()
	$CanvasLayer/TransicaoCasa/ColorRect/AnimationPlayer.play("animacao")
	Global.posicaox = $Personagem.position.x
	Global.posicaoy = $Personagem.position.y
	$Timer3.start()

func _on_passar_pressed(): #carrega dialogo com natalia 
	n += 1 
	Global.nthalia_index = n
	print(n)
	if n == 2:
		$Personagem/Camera2D/AnimationPlayer.play("mover")
		$dialogo.hide()
		$dialogo/Dialogo/Timer1.start()
	elif n == 4:
		$dialogo.hide()
		$dialogo/Dialogo/Timer2.start()
	elif n == 8:
		$dialogo.hide()
		$dialogo/Dialogo/Timer2.start()
	elif n == 6:
		$Personagem/Camera2D/AnimationPlayer.play("mover_2")
		$dialogo.hide()
		$sit_2.start()
		
	else:
		$dialogo/Dialogo/texto.text = dialogo[n]
		
	
func _on_Timer_timeout(): #fim do timer do dialogo e da cena 
	$Personagem/Camera2D/AnimationPlayer.play_backwards("mover")
	$dialogo/Dialogo/Timer2.start()
	
	
func _on_Timer2_timeout(): #personagem pode se mover dentro do mapa 
	Global.velocity(300)

func _on_transicao_timeout(): #tira a transição da tela 
	$Transition.queue_free()

func _on_Area2D_body_entered(body): #personagem entra na casa e carrega a transição de entrada
#	Global.nivel_2 = false
	get_tree().change_scene("res://casa_1_interno.tscn") # Replace with function body.

func esconder(): #esconde a hud 
	$gamepad.hide()
	$hud.hide()

func _on_Timer3_timeout(): #termina a situação 1 e muda de cena 
	get_tree().change_scene("res://cenas/situacoes/Situação1.tscn")
	
func _on_Timer4_timeout(): #carrega a hud 
#	$Transition.queue_free()
	$hud.show()
	$dialogo/Dialogo/texto.text = dialogo[Global.nthalia_index]
	Global.velocity(0)
	$dialogo.show()
	Global.current_state = Global.State.Situacao1

func _on_nivel_1_timeout():#ao subir de nivel inicia uma cutscene para mostrar a area liberando
	Global.velocity(0)
	$Personagem.hide()
	$Personagem/Camera2D/AnimationPlayer.play("area_desb")
	$area_desbloqueada.start()

func _on_area_desbloqueada_timeout(): # mostra os cones desaparecendo  e da queue free neles para que de para entrar na area
	$Sprite/AnimationPlayer.play("sumir")
	$Sprite/StaticBody2D.queue_free()
	$nivel_1_2.start()
	
func _on_nivel_12_timeout():# volta para a posição do personagem
	$Personagem/Camera2D/AnimationPlayer.play_backwards("area_desb")
	$area_reverso.start() 
	$Personagem.show()
	$Sprite.queue_free()
	
func _on_area_reverso_timeout():# deixa a camera na posição do personagem
	$Personagem/Camera2D.position = Vector2(0,0)
	Global.velocity(300)
	Global.area_1_desbl = true
	$Quest.start()

func _on_sit_2_timeout():
	$Personagem/Camera2D/AnimationPlayer.play_backwards("mover_2")
	Global.velocity(300)
	Global.controle_false()
	$Quest.start()

func _on_Button_pressed():
	Global.pontuacao +=2

func _on_mini_game_1_body_entered(body):
#	Global.atualizar_posicao($Personagem.posicaox, $Personagem.posicaoy)
	get_tree().change_scene("res://cenas/flappy/flappy.tscn")

func _on_situation_2_body_entered(body):
	if Global.situation_2 == false:
		get_tree().change_scene("res://cenas/situacoes/Situacao_2.tscn")
	else:
		pass
