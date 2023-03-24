extends Node2D

var dialogo = Global.falas['situacao2'] #utiliando a variavel definida no script do global
var n = 0 #controle do diálogo
var timer = Timer.new() #tempo de transição
var controle_situation = false
onready var imagem = $atencao #carrega a imagem atenção 

func _ready(): 
	Global.camera_state = Global.StateCameraClamp.On
#	$Personagem/Animacao.animation = ""
	$CanvasLayer.comecar_reverso()
	$CanvasLayer.timer() #inicia o tempo e animação reversa acima 
	$CaixaDialogo/conversa.text = dialogo[0]["text"] #carrega caixa de diálogo 
	$CaixaDialogo/VBoxContainer/Escolha1.hide() #esconde escolhas e feedback enquanto aparece perguntas 
	$CaixaDialogo/VBoxContainer/Escolha2.hide()
	$CaixaDialogo/VBoxContainer/Escolha3.hide()
	$CaixaDialogo/VBoxContainer/Escolha4.hide()
	$CaixaDialogo.hide()
	$NPC.position = Vector2(0,0)
	$NPC/NPC.stop()
	$NPC.show()
	$atencao.hide()
	$parabens.hide()
	$Transition.hide()
	match Global.current_state:
		Global.State.Situacao2_finish:
			$banco.queue_free()
			$exclamacao.queue_free()

func _on_Situao1_body_entered(body): #quando o jogador entra na área definida inicia a cena 
	$Timer.start()
	
func _on_Button_pressed(): #após a apresentação da pergunta as escolhas aparecem 
	n += 1 
	if n == 3:
		var escolhas = dialogo[n]
		$CaixaDialogo/conversa.hide()
		$CaixaDialogo/Button.hide()
		$CaixaDialogo/nome.hide()
		$CaixaDialogo/VBoxContainer/Escolha1.show()
		$CaixaDialogo/VBoxContainer/Escolha2.show()
		$CaixaDialogo/VBoxContainer/Escolha3.show()
		$CaixaDialogo/VBoxContainer/Escolha4.show()
		$CaixaDialogo/VBoxContainer/Escolha1.text = str(escolhas[1])
		$CaixaDialogo/VBoxContainer/Escolha2.text = str(escolhas[2])
		$CaixaDialogo/VBoxContainer/Escolha3.text = str(escolhas[3])
		$CaixaDialogo/VBoxContainer/Escolha4.text = str(escolhas[4])
		
	elif n > 4 and n < 10:
		n = 9
		$CaixaDialogo/conversa.text = dialogo[n]
	
	elif n >= 10:
		$CaixaDialogo.hide()
		$NPC/NPC/AnimationPlayer.play("sit_2_volta")
<<<<<<< HEAD
		$sit_2_volta.start()
		
=======
		Global.current_state = Global.State.Situacao2_finish

<<<<<<< Updated upstream
=======
>>>>>>> df50a0133f8ba55b90b307bbc80437265f25b159
>>>>>>> Stashed changes
	else:
		$CaixaDialogo/conversa.text = dialogo[n]["text"]
		$CaixaDialogo/nome.text = dialogo[n]["nome"]

func _on_sit_2_volta_timeout():
	Global.speed = 250
	Global.current_state = Global.State.Situacao2_finish
	$excl_mini_game.show()
	$mini_game_2/CollisionShape2D.set_disabled(false)
	
func _on_Escolha1_pressed(): #detecta a escolha feita pelo jogador e mostra o feedback respectivo 
	n += 1
	dialogo = dialogo[n][1]
	Global.pontuacao += 2
	clear() 
	$CaixaDialogo.hide()
	$parabens.visible = true
	$parabens/feedback.text = dialogo
	n = 5
	
func _on_Escolha2_pressed(): #detecta a escolha feita pelo jogador e mostra o feedback respectivo 
	n += 1
	dialogo = dialogo[n][2]
	Global.pontuacao += 2
	clear()
	$CaixaDialogo.hide()
	$parabens.show()
	$parabens/feedback.text = dialogo
	n = 6
	
func _on_Escolha3_pressed(): #detecta a escolha feita pelo jogador e mostra o feedback respectivo 
	n += 1
	dialogo = dialogo[n][3]
	Global.pontuacao += 0
	clear()
	$CaixaDialogo.hide()
	$atencao.show()
	$atencao/feedback.text = dialogo
	n = 7
	
func _on_Escolha4_pressed(): #detecta a escolha feita pelo jogador e mostra o feedback respectivo 
	n += 1
	dialogo = dialogo[n][4]
	Global.pontuacao += -1
	clear()
	$CaixaDialogo.hide()
	$atencao.show()
	$atencao/feedback.text = dialogo #controle de ordem de fala de acordo com o dicionário global 
	n = 8
	
func clear(): #encerra a cena 
	$CaixaDialogo/VBoxContainer/Escolha1.queue_free()
	$CaixaDialogo/VBoxContainer/Escolha2.queue_free()
	$CaixaDialogo/VBoxContainer/Escolha3.queue_free()
	$CaixaDialogo/VBoxContainer/Escolha4.queue_free()
	$CaixaDialogo/Button.show()
	$CaixaDialogo/nome.show()
	
func _on_passar_pressed(): #volta o personagem para o mapa 
	$atencao.hide()
	$parabens.hide()
	dialogo = Global.falas['situacao2']
	$CaixaDialogo.show()
	$CaixaDialogo/conversa.show()
	$CaixaDialogo/conversa.text = dialogo[n]
	
func _on_banco_body_entered(body):
	$Transition.show()
	$Transition.comecar()
	$transicaoTimer.start()
	Global.speed = 0
	
func _on_transicaoTimer_timeout():
	$Transition.comecar_reverso()
	$Timer.start()

func _on_Timer_timeout(): #carrega caixa de diálogo
	$Transition.queue_free()
	$Timer.queue_free()
	$NPC.show()
	$banco.queue_free()
	$exclamacao.queue_free()
	$NPC/NPC/AnimationPlayer.play("sit_2_ida")
	$animacao_player.start()
	
func _on_animacao_player_timeout():
	$CaixaDialogo.show()

func _on_saida_body_entered(body):
	get_tree().change_scene("res://cenas/mapa_principal/mapa_principal.tscn") 

func _on_npc_timeout():
	$NPC/NPC/AnimationPlayer.play("sit_2")
	$enemy.start()

func _on_enemy_timeout():
	$CaixaDialogo.show()
	$CaixaDialogo/conversa.text = dialogo[n]

<<<<<<< Updated upstream
=======
<<<<<<< HEAD
func _on_mini_game_2_body_entered(body):
	Global.posicao_bar = Vector2($Personagem.position.x, $Personagem.position.y)
	get_tree().change_scene("res://cenas/forca/forca.tscn")



=======
>>>>>>> df50a0133f8ba55b90b307bbc80437265f25b159
>>>>>>> Stashed changes
