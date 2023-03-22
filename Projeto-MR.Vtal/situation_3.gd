extends Node2D

var pontuacao = Global.pontuacao #utilizando a variavel definida no script do global
var dialogo = Global.falas['situcao3'] #utiliando a variavel definida no script do global
var n = 0 #controle do diálogo
var timer = Timer.new() #tempo de transição
var controle_situation = false
onready var imagem = $atencao #carrega a imagem atenção 

func _ready(): 
	Global.camera_state = Global.StateCameraClamp.Off
#	$Personagem/Animacao.animation = "cima"
#	$CanvasLayer.comecar_reverso()
#	$CanvasLayer.timer() #inicia o tempo e animação reversa acima 
	$CanvasLayer2/CaixaDialogo/nome.text = dialogo.nome1
	$CanvasLayer2/CaixaDialogo/conversa.text = dialogo[0] #carrega caixa de diálogo 
	$CanvasLayer2/CaixaDialogo/VBoxContainer/Escolha1.hide()
	$CanvasLayer2/CaixaDialogo/VBoxContainer/Escolha2.hide()
	$CanvasLayer2/CaixaDialogo/VBoxContainer/Escolha3.hide()
	$CanvasLayer2/CaixaDialogo/VBoxContainer/Escolha4.hide()
	$CanvasLayer3/parabens.hide()
	$CanvasLayer3/atencao.hide()
	$transition.hide()
	


	
func _on_Button_pressed(): #após a apresentação da pergunta as escolhas aparecem 
	n += 1 
	if n == 5:
		$CanvasLayer2/CaixaDialogo/conversa.hide()
		$CanvasLayer2/CaixaDialogo/Button.hide()
		$CanvasLayer2/CaixaDialogo/VBoxContainer/Escolha1.show()
		$CanvasLayer2/CaixaDialogo/VBoxContainer/Escolha2.show()
		$CanvasLayer2/CaixaDialogo/VBoxContainer/Escolha3.show()
		$CanvasLayer2/CaixaDialogo/VBoxContainer/Escolha4.show()
		print(n)
		
		
	elif n >=10:
		$CanvasLayer2/CaixaDialogo.hide()
		$finalizar_dialogo.start()
#		$AnimationPlayer.play_backwards("situation_3")
		print("sucesso")
		
	else:
		$CanvasLayer2/CaixaDialogo/conversa.text = dialogo[n]
		
	
func _on_Escolha1_pressed(): #detecta a escolha feita pelo jogador e mostra o feedback respectivo 
	dialogo = dialogo[n][1]
	pontuacao += 2
	clear() 
	$CanvasLayer2/CaixaDialogo.hide()
	$CanvasLayer3/parabens.visible = true
	$CanvasLayer3/parabens/feedback.text = dialogo.text
	n += 1
	
func _on_Escolha2_pressed(): #detecta a escolha feita pelo jogador e mostra o feedback respectivo 
	dialogo = dialogo[n][2]
	pontuacao += 1
	clear()
	$CanvasLayer2/CaixaDialogo.hide()
	$CanvasLayer3/parabens.show()
	$CanvasLayer3/parabens/feedback.text = dialogo.text
	n += 2
	
func _on_Escolha3_pressed(): #detecta a escolha feita pelo jogador e mostra o feedback respectivo 
	dialogo = dialogo[n][3]
	pontuacao += 0
	clear()
	$CanvasLayer2/CaixaDialogo.hide()
	$CanvasLayer3/atencao.show()
	$CanvasLayer3/atencao/feedback.text = dialogo.text
	n += 3
	
func _on_Escolha4_pressed(): #detecta a escolha feita pelo jogador e mostra o feedback respectivo 
	dialogo = dialogo[n][4]
	pontuacao += -1
	clear()
	$CanvasLayer2/CaixaDialogo.hide()
	$CanvasLayer3/atencao.show()
	$CanvasLayer3/atencao/feedback.text = dialogo.text
	n += 4 #controle de ordem de fala de acordo com o dicionário global 
	
func clear(): #encerra a cena 
	$CanvasLayer2/CaixaDialogo/VBoxContainer/Escolha1.queue_free()
	$CanvasLayer2/CaixaDialogo/VBoxContainer/Escolha2.queue_free()
	$CanvasLayer2/CaixaDialogo/VBoxContainer/Escolha3.queue_free()
	$CanvasLayer2/CaixaDialogo/VBoxContainer/Escolha4.queue_free()
	$CanvasLayer2/CaixaDialogo/Button.show()
	
func _on_passar_pressed(): #volta o personagem para o mapa 
	$CanvasLayer3/atencao.hide()
	$CanvasLayer3/parabens.hide()
	dialogo = Global.falas['situcao3']
	$finalizar_dialogo/resposta.start()

func _on_resposta_timeout():
	$CanvasLayer2/CaixaDialogo.show()
	$CanvasLayer2/CaixaDialogo/conversa.show()
	$CanvasLayer2/CaixaDialogo/conversa.text = dialogo[n]
	n += (10-n)
func _on_Area2D_body_entered(body):
	$start_situation.start()


func _on_saida_clube_body_entered(body):
	Global.atualizar_pontuacao(pontuacao)
	Global.current_state = Global.State.Situacao3_finish
	get_tree().change_scene("res://cenas/mapa_principal/mapa_principal.tscn") 


func _on_start_situation_timeout():
	$transition.show()
	$Node2D.queue_free()
	$AnimationPlayer.play("situation_3")
	$animation_1.start()


func _on_animation_1_timeout():
	$NPC.show()
	$transition.hide()
	$AnimationPlayer.play("npc_enemy")
	$start_dialogo.start()
	
func _on_start_dialogo_timeout():
	$CanvasLayer2/CaixaDialogo.show()


func _on_finalizar_dialogo_timeout():
	$AnimationPlayer.play_backwards("npc_enemy")
	$"transição_reverse".start()

func _on_transio_reverse_timeout():
	$transition.show()
	$AnimationPlayer.play_backwards("situation_3")
