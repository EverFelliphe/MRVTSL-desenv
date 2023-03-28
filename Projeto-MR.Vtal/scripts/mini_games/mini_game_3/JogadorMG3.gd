extends KinematicBody2D

export var speed = 400 #velocidade com que o jogador se movimenta
var screen_size #definirá o tamanho da tela
var controle = true #variável criada para que a movimentação possa ser ativada ou desativada por meio dela
var vel = Vector2(0,0)
var click_position = Vector2(0,0)

signal hit #sinal criado para quando o jogador colidir com um inimigo

func _ready(): 
	hide() #esconde o jogador, para que ele somente apareça ao se cliar no botão de iniciar 
	screen_size = get_viewport_rect().size #define o tamanho da tela
	click_position = Vector2(position.x,position.y)
	
func _process(delta:float) -> void: #função que define a movimentação do jogador de acordo com o input 
	var velocity = Vector2.ZERO
	match Global.current_state_mini_game_3:
		Global.State_mini_game_3.morto:
			hide()
			emit_signal("hit")
			$HitBox.set_deferred("disabled", true)
			
	if controle: #se controle for verdadeiro, executa a movimentação
		
		if Input.is_action_just_pressed("left_click"):
			click_position = get_global_mouse_position()
			
		var target_position = (click_position - position).normalized()
		if position.distance_to(click_position) > 3:
			move_and_slide(target_position * speed)


		if Input.is_action_pressed("ui_right"): 
			velocity.x += 1
		if Input.is_action_pressed("ui_left"):
			velocity.x -= 1
		if Input.is_action_pressed("ui_down"):
			velocity.y += 1 
		if Input.is_action_pressed("ui_up"):
			velocity.y -= 1  
		if velocity.length() > 0: #se alguma tecla estiver sendo pressionada, aplica a movimentação e a animação do jogador
			velocity = velocity.normalized() * speed
			$Animacao.play()
		else:
			$Animacao.stop()

		if velocity.x != 0: #regula a animação a ser usada de acordo com a direção do movimento do jogador
			$Animacao.animation = "direita"
			$Animacao.flip_v = false
			$Animacao.flip_h = velocity.x < 0 
		if velocity.y != 0:
			$Animacao.animation = "cima"
			$Animacao.flip_v = velocity.y > 0
		
		

	#Define o limite da tela, de forma que o jogador não possa ultrapassá-la
	move_and_slide(velocity * delta)
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	
func start(pos): #define a posição do player ao se iniciar o jogo
	position = pos
	show()
	$HitBox.disabled = false
	
#func _on_JogadorMG3_body_entered(body): #detecta colisão com o inimigo
#	hide()
#	emit_signal("hit")
#	$HitBox.set_deferred("disabled", true)

func parar(): #desabilita a movimentação do jogador 
	$HitBox.disabled = true
	controle = false
