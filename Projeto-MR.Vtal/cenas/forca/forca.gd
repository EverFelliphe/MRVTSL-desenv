extends Node2D

var palavra = 'etica'
var letras_ausentes = []
var letra 
var erros
func _ready():
	pass


func _on_Button_pressed():
<<<<<<< Updated upstream
=======
<<<<<<< HEAD
	match current_state:
		State.playing:
			letra = $letra.text.to_upper()
			if letra != '':
				$letra.text = ''
				if palavra.find(letra)!= -1:
					palavra = palavra.replace(letra, "")
					if letra =='E':
						$E.show()
						acertos += 1
					if letra =='T':
						$t.show()
						acertos += 1
					if letra =='I':
						$i.show()
						acertos += 1 
					if letra =='C':
						$c.show()
						acertos += 1
					if letra =='A':
						$a.show()
						acertos += 1

				else:
					letras_ausentes.append(letra)
					$erros.text = ''
					for i in letras_ausentes:
						$erros.text += '%s, ' % [str(i)] 
					if len(letras_ausentes) == 1:
						$cabeca.show()
					elif len(letras_ausentes) == 2:
						$corpocab.show()
					elif len(letras_ausentes) == 3:
						$braco.show()
					elif len(letras_ausentes) == 4:
						$spt.show()
					elif len(letras_ausentes) == 5:
						$sp1.show()
					elif len(letras_ausentes) == 6:
						$inicial.show()
					elif len(letras_ausentes) == 7:
						$fim.show()
						$reiniciar.show()
						$sair.show()
						current_state = State.game_over
		State.game_over:
			pass

func _on_sair_pressed():
	Global.pontuacao += 2
	get_tree().change_scene("res://cenas/situacoes/Situacao_2.tscn")

func _on_reiniciar_pressed():
	_ready()
	current_state = State.playing
=======
>>>>>>> Stashed changes
	letra = $letra.text
	if palavra.find(letra)!=-1:
		palavra = palavra.replace(letra, "")
		if letra =='e':
			$E.show()
		if letra =='t':
			$t.show()
		if letra =='i':
			$i.show()
		if letra =='c':
			$c.show()
		if letra =='a':
			$a.show()
		
	else:
		letras_ausentes.append(letra)
		$erros.text = str(letras_ausentes)
		if len(letras_ausentes) == 1:
			$cabeca.show()
		elif len(letras_ausentes) == 2:
			$corpocab.show()
		elif len(letras_ausentes) == 3:
			$braco.show()
		elif len(letras_ausentes) == 4:
			$spt.show()
		elif len(letras_ausentes) == 5:
			$sp1.show()
		elif len(letras_ausentes) == 6:
			$inicial.show()
		elif len(letras_ausentes) == 7:
			$fim.show()
			$Button2.show()
			$Button3.show()
		
		
<<<<<<< Updated upstream
=======
>>>>>>> df50a0133f8ba55b90b307bbc80437265f25b159
>>>>>>> Stashed changes
