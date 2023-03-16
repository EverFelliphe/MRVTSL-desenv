extends Area2D

var pontuacao = Global.pontuacao #utilizando a variavel definida no script do global
var dialogo = Global.falas['situacao2'] #utiliando a variavel definida no script do global
var n = 0 #controle do diálogo
var timer = Timer.new() #tempo de transição
var controle_situation = false
onready var imagem = $atencao #carrega a imagem atenção 

func _ready(): #
	$CanvasLayer.comecar_reverso()
	$CanvasLayer.timer() #inicia o tempo e animação reversa acima 
	$CaixaDialogo/nome.text = dialogo.nome1
	$CaixaDialogo/conversa.text = dialogo[0] #carrega caixa de diálogo 
	$CaixaDialogo/VBoxContainer/Escolha1.hide() #esconde escolhas e feedback enquanto aparece perguntas 
	$CaixaDialogo/VBoxContainer/Escolha2.hide()
	$CaixaDialogo/VBoxContainer/Escolha3.hide()
	$CaixaDialogo/VBoxContainer/Escolha4.hide()
	$CaixaDialogo.hide()
	$NPC.hide()
	$atencao.hide()
	$parabens.hide()

func _on_Situao1_body_entered(body): #quando o jogador entra na área definida inicia a cena 
	$NPC.show()
	$Timer.start()

func _on_Timer_timeout(): #carrega caixa de diálogo
	$Timer.queue_free()
	$NPC.show()
	$CaixaDialogo.show()
	$NPC.animation = "esquerda"[0]
	$banco.queue_free()
	
func _on_Button_pressed(): #após a apresentação da pergunta as escolhas aparecem 
	n += 1 
	if n == 5:
		$CaixaDialogo/conversa.hide()
		$CaixaDialogo/Button.hide()
		$CaixaDialogo/VBoxContainer/Escolha1.show()
		$CaixaDialogo/VBoxContainer/Escolha2.show()
		$CaixaDialogo/VBoxContainer/Escolha3.show()
		$CaixaDialogo/VBoxContainer/Escolha4.show()
		print(n)
	elif n ==2:
		$CaixaDialogo.hide()
		$npc.start()
		
	elif n >=10:
		$CaixaDialogo.hide()
		$NPC/AnimationPlayer.play_backwards("sit_2")
		print("sucesso")
		
	else:
		$CaixaDialogo/conversa.text = dialogo[n]
		
	
func _on_Escolha1_pressed(): #detecta a escolha feita pelo jogador e mostra o feedback respectivo 
	dialogo = dialogo[n][1]
	pontuacao += 2
	clear() 
	$CaixaDialogo.hide()
	$parabens.visible = true
	$parabens/feedback.text = dialogo.text
	n += 1
	
func _on_Escolha2_pressed(): #detecta a escolha feita pelo jogador e mostra o feedback respectivo 
	dialogo = dialogo[n][2]
	pontuacao += 1
	clear()
	$CaixaDialogo.hide()
	$parabens.show()
	$parabens/feedback.text = dialogo.text
	n += 2
	
func _on_Escolha3_pressed(): #detecta a escolha feita pelo jogador e mostra o feedback respectivo 
	dialogo = dialogo[n][3]
	pontuacao += 0
	clear()
	$CaixaDialogo.hide()
	$atencao.show()
	$atencao/feedback.text = dialogo.text
	n += 3
	
func _on_Escolha4_pressed(): #detecta a escolha feita pelo jogador e mostra o feedback respectivo 
	dialogo = dialogo[n][4]
	pontuacao += -1
	clear()
	$CaixaDialogo.hide()
	$atencao.show()
	$atencao/feedback.text = dialogo.text
	n += 4 #controle de ordem de fala de acordo com o dicionário global 
	
func clear(): #encerra a cena 
	$CaixaDialogo/VBoxContainer/Escolha1.queue_free()
	$CaixaDialogo/VBoxContainer/Escolha2.queue_free()
	$CaixaDialogo/VBoxContainer/Escolha3.queue_free()
	$CaixaDialogo/VBoxContainer/Escolha4.queue_free()
	$CaixaDialogo/Button.show()
	
func _on_passar_pressed(): #volta o personagem para o mapa 
	$atencao.hide()
	$parabens.hide()
	dialogo = Global.falas['situacao2']
	$resposta.start()
	


func _on_banco_body_entered(body):
	$Timer.start()


func _on_saida_body_entered(body):
	Global.controle_false()
	Global.atualizar_pontuacao(pontuacao)
	get_tree().change_scene("res://cenas/mapa_principal/mapa_principal.tscn") 


func _on_npc_timeout():
	$NPC/AnimationPlayer.play("sit_2")
	
	$enemy.start()
	
	


func _on_enemy_timeout():
	$CaixaDialogo.show()
	$CaixaDialogo/conversa.text = dialogo[n]


func _on_resposta_timeout():
	$CaixaDialogo.show()
	$CaixaDialogo/conversa.show()
	$CaixaDialogo/conversa.text = dialogo[n]
	n +=(10-n)
