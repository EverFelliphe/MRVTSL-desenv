extends Node2D

var status = 0
var score = 0
var y = 0.8
var x = 2
var meta = 10

func _ready():
	$sair_ganho.hide()
	$Button_final.hide()
	$passou.hide()

func _process(delta):
	if status == 1:
		$background.position.x -= 1*x    
		if ($background.position.x) < -100:
			$background.position.x = 1048
		$columns.position.x -= 2*x           
		if ($columns.position.x) < -300:
			$columns.position.x = rand_range(200, 600) - 50
			$columns.position.y = rand_range(0, 400) - 200
		$ferramenta.position.y += y

		if $ferramenta.position.y > 600:
			$ferramenta.position.y = 480
			status = 0

		if $ferramenta.position.y < -20:
			$ferramenta.position.y = -20
		if Input.is_action_pressed("ui_down"):
				$ferramenta.position.y += 2

		if Input.is_action_pressed("ui_up"):
			$ferramenta.position.y -= 4
		if score == meta:
			$passou.show()
			#código que adiciona pontos globais         adicionar

func _on_game_over_pressed():
	status = 1
	$game_over.hide()

func _on_columns_body_shape_entered(body_id, body, body_shape, local_shape):
	if (local_shape < 2): #esse node tem 3 shapes de colisão: 0 e 1 são as colunas
		status = 0 #muda o status para "parado"
		$Button_final.show()
		if score >= 5:
			$sair_ganho.show()

#executa essa função quando o dragão atravessa entre as colunas
func _on_columns_body_shape_exited(body_id, body, body_shape, local_shape):
	if (local_shape == 2): #esse node tem 3 shapes de colisão: 0 e 1 são as colunas
		score += 1 #aumenta o score
		print(score)
		$score.text = ("Score: %d" % [score]) #atualiza o painel

func _on_Button_final_pressed():
	status = 1
	$Button_final.hide()

func _on_sair_ganho_pressed():
	Global.pontuacao +=2
	get_tree().change_scene("res://cenas/mapa_principal/mapa_principal.tscn")
