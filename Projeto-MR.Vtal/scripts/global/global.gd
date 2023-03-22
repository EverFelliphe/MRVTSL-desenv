extends Node

var falas = {#dicionario contendo o diálogo inicial com o guia fabricio e do diamante no tutorial
	'fabricio': {
		"nome":"Fabricio",
		0: "Olá, tudo bem? Prazer em conhecê-lo, eu sou o Fabrício, e trabalho na V.Tal. Estarei aqui para te auxiliar!",
		1: "Vi no seu currículo que você se formou no Inteli, um dos maiores institutos de tecnologia do mundo, e quem sabe do Brasil!",
		2: "Vejo em você um enorme potencial para alcançar o cargo mais alto da V.Tal, o Rei das Fibras, e se tornar um grande funcionário da nossa empresa.",
		3: "Entretanto, não basta ser um mestre da tecnologia. Precisamos que você também esteja alinhada aos nossos valores éticos, e pra isso precisamos que você domine nosso Código de Ética!",
		4: "Poderíamos te passar um arquivo com 50 páginas para ler, mas sabemos o quão tedioso é isso. Então, em vez disso, vamos te passar algumas tarefas, nas quais sua conduta ética será testada!",
		5: "Assim, você passará por situações que irão testar seu comportamento perante dilemas éticos e, de acordo com sua reação, você receberá pontos de reputação!",
		6: "Ao conseguir uma certa quantidade de pontos de reputação, você subirá de nível, recebendo um novo título, até chegar ao tão sonhado Rei das Fibras!",
		7: "Mas não se preocupe, todas as instruções de como fazer as tarefas serão passadas por minha colega Nathália! Ela irá te ajudar durante o seu trajeto na empresa."
	},
	'diamante': {
		0: 'Use as setas no canto inferior esquerdo para se movimentar pelo mapa!',
		1: 'Clique no botão “X” para abrir o minimapa. Ele irá mostrar sua localização na cidade e seu próximo destino',
		2: 'No canto da tela, você pode clicar no botão “Y” para ligar ou desligar o som do jogo.'
	},
	'situacao1': {
		"nome":"Robert",
		0: "Boa tarde, meu nome é Robert e eu trabalho na Claro, vi que você trabalha na V.tal para qual empresa você está indo instalar a fibra?",
		1: "Estou indo instalar da Tim",
		2: "Eu te pago uma grana se você instalar essa fibra da minha empresa",
		3: {
			1: {"text":"Parabéns!! Você escolheu a opção mais ética", "feedback":"res://imagens/parabens.png"},
			2: {"text":"Parabéns!! Você escolheu uma ótima opção, agindo plenamente de acordo com o código de ética da empresa. Entretanto, faltou reportar a situação para o compliance, para que possamos ter um controle da situação!", "feedback":"res://imagens/parabens.png"},
			3: {"text":"A família tem grande importância, mas devemos sempre ter um comportamento ético. A opção mais ética seria recusar a proposta e reportar ao compliance, já que se trata de uma tentativa de suborno", "feedback":"res://imagens/aten.png"},
			4: {"text":"A opção mais ética seria recusar a proposta e reportar ao compliance, já que se trata de uma tentativa de suborno, portanto, aceitar o dinheiro seria totalmente contra o código de ética da empresa.", "feedback":"res://imagens/aten.png"}
		}
	},
	'situacao2':{
		'nome1':'',
		'nome2':'',
		0:'Ei, cara, há quanto tempo não te vejo! Vi que você foi contratado pela V.Tal, como tem sido o seu trabalho lá até então?',
		1:'Ah, oi Paulo! Tem sido bem interessante, estou aprendendo bastante. E você, ainda está trabalhando na 	Boa Comunicações?',
		2:'Sim, sigo firme e forte lá! Inclusive, estamos pensando em lançar um novo produto, que irá explodir a mente dos clientes. E vocês, trabalhando em algo novo?',
		3: {
			1: "Esquece o trabalho cara, vamos falar sobre outra coisa! Viu o último jogo do Flamengo?",
			2: "Ah sabe como é, prefiro não comentar assuntos sobre o trabalho",
			3: "Estamos trabalhando para conseguir oferecer um pacote de 1 GB para nossos clientes, além de expandir nosso mercado no Centro-Oeste",
			4: "Posso até te contar sobre o que estamos fazendo, mas tudo tem o seu preço"
		},
		4:{
			1: "Ótima escolha! Você mudou de assunto para não violar o código de ética, já que divulgar informações confidenciais de clientes é contrário aos valores da V.Tal.",
			2: "Ótima escolha! Você se recusou a divulgar informações sigilosas da empresa para a concorrência.",
			3: "Apesar de estar em um momento descontraído, você não pode divulgar informações de cliente para pessoas de fora, especialmente concorrentes, já que isso viola o Código de Ética e Conduta da V.Tal.",
			4: "Você escolheu uma opção antiética. Divulgar informações confidenciais de clientes é contrário aos valores da V.Tal e receber dinheiro para fazê-lo é pior ainda, constituindo um crime. Você deveria ter mudado de assunto ou se recusar a fornecer as informações ao amigo."
		},
		5: "Que jogo feio foi aquele! Minha bisavó jogaria futebol melhor do que aqueles caras!",
		6: "Tudo bem, te entendo! Às vezes é realmente melhor não comentar esses tipos de dados com os outros",
		7: "Ótima proposta, aposto que será uma grande inovação no mercado. E até que ela me deu uma ideia muito boa...",
		8: "Eu até estaria disposto a pagar por isso, mas estou sem dinheiro no momento! Fica para a próxima.",
		9: "Mas enfim, tenho que ir embora para ficar com a família. Até a próxima, foi um prazer te encontrar de novo!",
	},
	"situcao3":{
		'nome1':'',
		0:'teste1',
		1:'teste2',
		2:'teste3',
		3:'teste4',
		4:'teste5',
		5:{
			1: {"text":"aaaaaaaaa", "feedback":"res://imagens/parabens.png"},
			2: {"text":"bbbbbbbbb", "feedback":"res://imagens/parabens.png"},
			3: {"text":"ccccccccc", "feedback":"res://imagens/aten.png"},
			4: {"text":"ddddddddd", "feedback":"res://imagens/aten.png"}
		},
		6: 'sem problemas',
		7: 'sem problemas',
		8: 'sem problemas',
		9: 'sem problemas',
	},
	"nathalia": {
		0: "Olá, eu sou a Nathália, e sou funcionária da Vtal! E assim como o Fabrício, te auxiliarei na sua jornada. Te ajudarei passando instruções sobre o que fazer ao longo da sua jornada, por meio dessas ligações!",
		1: "Como sua primeira tarefa, precisamos que você instale a fibra ótica de um cliente na casa do quarteirão abaixo!",
		2: "Olá novamente, estou aqui para indicar a sua 2 mssão",
		3: "a partir de agora você enfrentara dilemas mais sutis, porém não menos importantes. Dica. separe pessoal do profissional",
		4: "teste3",
		5: "teste4",
		6: "teste 5",
		7: "teste 6",
	}
}
enum state_situations {INIT,SITUATION_1, SITUATION_2,  SITUATION_3}
enum state_areas {AREA_1, AREA_2,  AREA_3}
enum state_person{FRENTE,TRAS,ESQUERDA,DIREITA,PARADO}
enum state_nivel{N1,N2,N3,N4,N5}

enum StateCameraClamp {
	On
	Off
}
var camera_state = StateCameraClamp.On

enum State {
	Inicio
	Situacao1
	Situacao1_finish
	Situacao2
	Situacao2_finish
	Mini_Game2
	Situacao3
	Situacao3_finish
	Mini_Game3
	Final
}
var moldura  = "res://imagens/níveis/MolduraDefensorPronta.png"
var current_state = State.Inicio
var call_index = 0
var cutscene_index = 0
var current_area = state_areas.AREA_1
var current_situations = state_situations.INIT
var current_person = state_person.PARADO
var current_nivel = state_nivel.N1
var nivel_index = 0
var nivel_1= false #variavel de controle de nível
var nivel_2= false #variavel de controle de nível
var nivel_3= false #variavel de controle de nível
var nivel_4= false #variavel de controle de nível
var nivel_5= false #variavel de controle de nível
var situation_2 = false
var area_1_desbl = false #variavel de controle para areas já desbloqueadas
var controle_nathalia = true # variavel de controle do dialogo inicial
var nthalia_index = 0
var posicaox = 142
var posicaoy = 201
var pontuacao = 0 #pontuação do personagem
var controle_tela = true
var teste

func tela():
	controle_tela = false

func atualizar_pontuacao(x):
	pontuacao = x 
	
func atualizar_posicao(x,y):
	posicaox = x
	posicaoy = y
	
func velocity(x):
	speed = x 

var speed = 250
# Called when the node enters the scene tree for the first time.
func _ready():
	controle_nathalia = true
