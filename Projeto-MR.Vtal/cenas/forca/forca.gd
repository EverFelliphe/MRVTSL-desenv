extends Node2D

var palavra = 'etica'
var letras_ausentes = []
var letra 
var erros
func _ready():
	pass


func _on_Button_pressed():
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
		
		
