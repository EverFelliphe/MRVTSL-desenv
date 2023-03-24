extends Node2D

var pontuacao = Global.pontuacao #utilizando a variavel definida no script do global
var dialogo = Global.falas['situcao3'] #utiliando a variavel definida no script do global
var n = 0 #controle do diálogo
var timer = Timer.new() #tempo de transição
var controle_situation = false
onready var imagem = $atencao #carrega a imagem atenção 
var controle 
var i 

func _ready(): 
	Global.camera_state = Global.StateCameraClamp.Off
#	$Personagem/Animacao.animation = "cima"
#	$CanvasLayer.comecar_reverso()
#	$CanvasLayer.timer() #inicia o tempo e animação reversa acima 
	$CanvasLayer2/CaixaDialogo/conversa.text = dialogo[0]["text"] #carrega caixa de diálogo 
	$CanvasLayer2/CaixaDialogo/nome.text = dialogo[0]["nome"]
	$CanvasLayer2/CaixaDialogo/VBoxContainer/Escolha1.hide()
	$CanvasLayer2/CaixaDialogo/VBoxContainer/Escolha2.hide()
	$CanvasLayer2/CaixaDialogo/VBoxContainer/Escolha3.hide()
	$CanvasLayer2/CaixaDialogo/VBoxContainer/Escolha4.hide()
	$CanvasLayer3/parabens.hide()
	$CanvasLayer3/atencao.hide()
	$transition.hide()
	$mission_sec.hide()
	match Global.current_nivel:
		Global.state_nivel.N4:

			print('ww')

			$mission_sec.queue_free()
	match Global.current_state:
		Global.State.Situacao3_finish:
			$Node2D.queue_free()
			$mission_sec.show()
	
func _on_Button_pressed(): #após a apresentação da pergunta as escolhas aparecem 
	n += 1 
	print(n)
	if n == 4:
		$CanvasLayer2/CaixaDialogo/conversa.hide()
		$CanvasLayer2/CaixaDialogo/Button.hide()
		$CanvasLayer2/CaixaDialogo/nome.hide()
		$CanvasLayer2/CaixaDialogo/VBoxContainer/Escolha1.show()
		$CanvasLayer2/CaixaDialogo/VBoxContainer/Escolha2.show()
		$CanvasLayer2/CaixaDialogo/VBoxContainer/Escolha3.show()
		$CanvasLayer2/CaixaDialogo/VBoxContainer/Escolha4.show()
		
#	elif n == 7:
#		$CanvasLayer2/CaixaDialogo/conversa.text = dialogo[n]["text"]
#		$CanvasLayer2/CaixaDialogo/nome.text = dialogo[n]["nome"]
#		n = 3


		
	elif n >= 5:
		$CanvasLayer2/CaixaDialogo.hide()
		if controle:
			$CanvasLayer3/parabens.show()
		else:
			$CanvasLayer3/atencao.show()

	else:
		$CanvasLayer2/CaixaDialogo/conversa.text = dialogo[n]["text"]
		$CanvasLayer2/CaixaDialogo/nome.text = dialogo[n]["nome"]
		
	
func _on_Escolha1_pressed(): #detecta a escolha feita pelo jogador e mostra o feedback respectivo 
	Global.pontuacao += 0
	clear() 
	$CanvasLayer3/atencao/feedback.text = dialogo[8][1]["text"]
#	controle = false
	n += 1
	$CanvasLayer2/CaixaDialogo/conversa.show()
	$CanvasLayer2/CaixaDialogo/nome.show()
	$CanvasLayer2/CaixaDialogo/conversa.text = dialogo[n]["text"]
	$CanvasLayer2/CaixaDialogo/nome.text = dialogo[n]["nome"]
	
func _on_Escolha2_pressed(): #detecta a escolha feita pelo jogador e mostra o feedback respectivo 
	Global.pontuacao += 0
	clear()
	n = 3
	$CanvasLayer2/CaixaDialogo/conversa.show()
	$CanvasLayer2/CaixaDialogo/nome.show()
	$CanvasLayer2/CaixaDialogo/conversa.text = dialogo[6]["text"]
	$CanvasLayer2/CaixaDialogo/nome.text = dialogo[6]["nome"]
	
func _on_Escolha3_pressed(): #detecta a escolha feita pelo jogador e mostra o feedback respectivo 
	Global.pontuacao += 2
	clear()
	$CanvasLayer3/parabens/feedback.text = dialogo[8][3]["text"]
	controle = true
	n += 2
	$CanvasLayer2/CaixaDialogo/conversa.show()
	$CanvasLayer2/CaixaDialogo/nome.show()
	$CanvasLayer2/CaixaDialogo/conversa.text = dialogo[n + 1]["text"]
	$CanvasLayer2/CaixaDialogo/nome.text = dialogo[n + 1]["nome"]
	 
func _on_Escolha4_pressed(): #detecta a escolha feita pelo jogador e mostra o feedback respectivo 
	Global.pontuacao += 0
	clear()
	$CanvasLayer3/atencao/feedback.text = dialogo[8][4]["text"]
	controle = false
	n = 4 #controle de ordem de fala de acordo com o dicionário global 
	$CanvasLayer2/CaixaDialogo/conversa.show()
	$CanvasLayer2/CaixaDialogo/nome.show()
	$CanvasLayer2/CaixaDialogo/conversa.text = dialogo[n + 1]["text"]
	$CanvasLayer2/CaixaDialogo/nome.text = dialogo[n + 1]["nome"]
	
func clear(): #encerra a cena 
	$CanvasLayer2/CaixaDialogo/VBoxContainer/Escolha1.hide()
	$CanvasLayer2/CaixaDialogo/VBoxContainer/Escolha2.hide()
	$CanvasLayer2/CaixaDialogo/VBoxContainer/Escolha3.hide()
	$CanvasLayer2/CaixaDialogo/VBoxContainer/Escolha4.hide()
	$CanvasLayer2/CaixaDialogo/Button.show()
	
func _on_passar_pressed(): #volta o personagem para o mapa 
	$finalizar_dialogo.start()
	$CanvasLayer3/atencao.queue_free()
	$CanvasLayer3/parabens.queue_free()

func _on_resposta_timeout():
	$CanvasLayer2/CaixaDialogo.show()
	$CanvasLayer2/CaixaDialogo/conversa.show()
	$CanvasLayer2/CaixaDialogo/conversa.text = dialogo[n]
	n += (10-n)
	
func _on_Area2D_body_entered(body):
	$transition.show()
	$AnimationPlayer.play("situation_3")
	$start_situation.start()
	Global.speed = 0

func _on_saida_clube_body_entered(body):
	Global.atualizar_pontuacao(pontuacao)
	Global.current_state = Global.State.Situacao3_finish
	get_tree().change_scene("res://cenas/mapa_principal/mapa_principal.tscn") 

func _on_start_situation_timeout():
	$Node2D.queue_free()
	$animation_1.start()

func _on_animation_1_timeout():
	$NPC.show()
	$transition.hide()
	$AnimationPlayer.play("npc_enemy")
	$start_dialogo.start()
	
func _on_start_dialogo_timeout():
	$CanvasLayer2/CaixaDialogo.show()

func _on_finalizar_dialogo_timeout():
	$AnimationPlayer.play("npc_enemy_backwards")
	$"transição_reverse".start()

func _on_transio_reverse_timeout():
	$transition.show()
	Global.current_state = Global.State.Situacao3_finish
	$AnimationPlayer.play_backwards("situation_3")
	$mission_sec.show()
	Global.speed = 250

func _on_mission_sec_body_entered(body):
	match Global.current_state:
		Global.State.Situacao3_finish:
			get_tree().change_scene("res://MiniGame3.tscn")
