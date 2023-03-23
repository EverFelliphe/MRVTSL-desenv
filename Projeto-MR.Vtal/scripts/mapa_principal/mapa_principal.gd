extends Node2D

var dialogo = Global.falas["nathalia"] #carrega falas da nathalia 
var n = Global.nthalia_index #controle de falas, indíce do dicionário 
var controle = Global.controle_nathalia #controla se está no diálogo da nathalia, dicionário nathalia 
var nivel_2 = Global.nivel_2#verifica se o player passou de nível para iniciar a cutscene 
var current_state = Global.current_state
var i = Global.call_index
var j = Global.cutscene_index

func _ready(): 
	$hud.hide()
	$gamepad.hide()
	Global.camera_state = Global.StateCameraClamp.Off
	$Personagem.position = Vector2(Global.posicaox , Global.posicaoy) 
	$dialogo.hide() #esconde dialogo e falas durante início da cena 
	match current_state: #primeira abertura do jogo inicia dialogo com nathalia  
		Global.State.Inicio:
			Global.controle_nathalia = false
			$sec_mission.hide()
			$CanvasLayer.hide()
			$hud.hide()
			$dialogo.hide()
			$Transition.show()
			$Transition/Fill/animation.play_backwards("transicao")
			$Timer4.start()
			$mini_game_1/poste.set_disabled(true)
	#		Global.nivel_1 = true
	#		Global.pontuacao = 0
	 #quando ele voltar da situação ele esconde a exclamação, atualiza a posição do personagem e apaga o dialogo inicial
		Global.State.Situacao1:
			tocar_transicao()
			$sec_mission.queue_free()
			
		Global.State.Situacao1_finish:
			if i == 0:
				Global.call_index += 1
				$Situacao.queue_free()
				$excl.queue_free()
				$sec_mission.show()
				$Transition.show()
				$Transition/Fill/animation.play_backwards("transicao")
#				$Quest.start()
			else:
				$Situacao.queue_free()
				$excl.queue_free()
				$sec_mission.show()
				$Transition.show()
				$Transition/Fill/animation.play_backwards("transicao")
			tocar_transicao()
				
		Global.State.Situacao2:
			tocar_transicao()
			$mini_game_1.queue_free()
			$excl.hide()
			$sec_mission.play()
			$Quest.start()
			$Transition.hide()
		Global.State.Situacao2_finish:
			tocar_transicao()
			$Sprite.queue_free()
			$Situacao.queue_free()
			$excl.queue_free()
			$mini_game_1.queue_free()
			$sec_mission.queue_free()
			
	match Global.current_nivel:
				Global.state_nivel.N2:
					if j == 0 :
						$nivel_1.start()
						$mini_game_1.queue_free()
						$sec_mission.hide()
						Global.cutscene_index = 1
					else: pass
				Global.state_nivel.N3:
					if j == 0 :
						$nivel_2.start()
						Global.cutscene_index = 1
					else: pass
			
	 
	match Global.current_area:
			Global.state_areas.AREA_2:
				if j!=0:
					$excl.hide()
					$mini_game_1.queue_free()
					$Sprite.queue_free()
					$sec_mission.hide()
				else: pass
			Global.state_areas.AREA_3:
				if j!=0:
					$excl.hide()
					$Sprite.queue_free()
					$Sprite2.queue_free()
					$sec_mission.hide()
				else:pass
#	if Global.pontuacao == 4 :
#		$nivel_1.start()

func _process(delta):

	current_state = Global.current_state
	if Global.controle_nathalia == true:
			$hud.show()
			$dialogo/Dialogo/texto.text = dialogo[Global.nthalia_index]
			Global.velocity(0)
			$dialogo.show()
			Global.controle_nathalia  = false
			
	
#	match Global.current_nivel:
#		Global.state_nivel.N1:
#			$nivel_1.start()
		
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
	
	if n == 2:
		$Personagem/Camera2D/AnimationPlayer.play("mover")
		$dialogo.hide()
		$dialogo/Dialogo/Timer1.start()
	elif n == 4:
		$dialogo.hide()
		$dialogo/Dialogo/Timer2.start()
		$Personagem/Camera2D/AnimationPlayer.play("bar_desbloq")
		$bar_desbloq.start()
	elif n == 6:
		$Personagem/Camera2D/AnimationPlayer.play("mover_2")
		$dialogo.hide()
		$sit_2.start()
	elif n == 8:
		$dialogo.hide()
		$dialogo/Dialogo/Timer2.start()
	
		
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
	$Quest.start()

#func _on_Button_pressed():
#	Global.pontuacao +=2

func _on_mini_game_1_body_entered(body):
#	Global.atualizar_posicao($Personagem.posicaox, $Personagem.posicaoy)
	get_tree().change_scene("res://cenas/flappy/flappy.tscn")

func _on_situation_2_body_entered(body):
	if current_state == Global.State.Situacao1_finish:
		get_tree().change_scene("res://cenas/situacoes/Situacao_2.tscn")
	else:
		pass

func _on_bar_desbloq_timeout():
	$Personagem/Camera2D/AnimationPlayer.play_backwards("bar_desbloq")
	Global.speed = 250

func _on_nivel_2_timeout():
	Global.velocity(0)
#	$Personagem.hide()
	$Personagem/Camera2D/AnimationPlayer.play("area_2")
	$area_desb_3.start()


func _on_area_desb_3_timeout():
	$Sprite/AnimationPlayer.play("sumir_2")
	$sumir_2.start()

func _on_sumir_2_timeout():
	$Personagem/Camera2D/AnimationPlayer.play_backwards("area_2")
	$area_reverso.start() 
	$Personagem.show()
	$Sprite2.queue_free()
	Global.current_area = Global.state_areas.AREA_3
	Global.current_area = Global.state_areas.AREA_2

func tocar_transicao():
	$CanvasLayer.show()
	$Transition.queue_free()
	$CanvasLayer/TransicaoCasa/ColorRect/AnimationPlayer.play_backwards("animacao")
	$CanvasLayer/TransicaoCasa/timer_transition.start()

func _on_timer_transition_timeout():
	$CanvasLayer.queue_free()
	$hud.show()
	$gamepad.show()
