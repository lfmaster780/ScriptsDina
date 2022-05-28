extends Node2D

var preRelogio = preload("res://scenes/garanhuns/PuzzleRelogio.tscn")
var preDialogo = preload("res://scenes/CaixaDialogo.tscn")
var preCaixa = preload("res://scenes/garanhuns/PuzzleCaixa.tscn")
var preTesouro = preload("res://scenes/garanhuns/PuzzleTesouro.tscn")

var dina = {"neutra":load("res://sprites/perosnagens/dinaFrente.png"),
"perfil":load("res://sprites/perosnagens/dinaPerfil.png"),
"confusa":load("res://sprites/perosnagens/dinaDuvida.png"),
"triste": load("res://sprites/perosnagens/dinaTriste.png"),
"feliz": load("res://sprites/perosnagens/dinaFeliz.png"),
"vergonha": load("res://sprites/perosnagens/dinaVergonha.png")}

var mimi = {"neutra":load("res://sprites/perosnagens/Mimi.png"),
"bilhete":load("res://sprites/garanhuns/extra/cat/Dead (1).png")}

var estagio = -1

var passaporte = {"fechado":load("res://sprites/garanhuns/passaporte.png"), "aberto":load("res://sprites/garanhuns/passaporteaberto.png")}
var personagensAtivos = {"Dina":false,"Mimi":false,"Professora":false}
var personagemFalando = ""
var falaIndex = -1

var posPuzzle = false

var timeout = false

func _ready():
	var dialogos = ["preCaixa1"]
	var pessoas = ["Dina"]
	GameController.setDialogo(dialogos,pessoas)
	personagensAtivos = {"Dina":true,"Mimi":false,"Professora":false}
	chamarDialogo()

func _process(delta):
	if estagio == 2 and falaIndex == 2 and not posPuzzle:
		$Personagens/Dina.texture = dina["perfil"]
	elif estagio == 2 and falaIndex == 4 and not posPuzzle:
		$Personagens/Dina.texture = dina["feliz"]
	elif estagio == 1 and falaIndex == 1 and posPuzzle:
		$Personagens/Dina.texture = dina["confusa"]
	elif estagio == 3:
		$Personagens/Dina.texture = dina["neutra"]
	elif estagio == 5 and falaIndex == 1:
		$Personagens/Dina.texture = dina["confusa"]
	elif estagio == 5 and falaIndex == 3:
		$Personagens/Dina.texture = dina["feliz"]
	elif estagio == 6 and posPuzzle and falaIndex == 1:
		$Personagens/Dina.texture = dina["neutra"]
	elif estagio == 8 and falaIndex == 5:
		$Bilhetes/Mirante/Lupa.visible = true
	elif estagio == 8 and falaIndex == 6:
		$Personagens/Dina.texture = dina["feliz"]
	elif estagio == 9 and falaIndex == 6:
		$Personagens/Dina.texture = dina["vergonha"]
	elif estagio == 10 and falaIndex == 3:
		$Bilhetes/Passaporte.texture = passaporte["aberto"]
	elif estagio == 10 and falaIndex == 8:
		$Personagens/Dina.texture = dina["feliz"]
		
	if estagio == 6 and falaIndex == 2 and posPuzzle:
		$Bilhetes/AoSul.visible = true
	
	

func chamarDialogo():
	var dialogo = preDialogo.instance()
	var view = get_viewport_rect()
	dialogo.rect_size = view.size
	add_child(dialogo)
	ativarPersonagens()
	dialogo.get_node("Dialogo").iniciar()
	
func startPuzzleEnigma():
	var enigma = preCaixa.instance()
	add_child(enigma)

func finalizarEnigma():
	#chamar pos puzzle
	posPuzzle = true
	$Bilhetes/BilheteFechado.visible = true
	var dialogos = ["posCaixa1", "posCaixa2","posCaixa3"]
	var pessoas = ["Professora","Dina","Professora"]
	personagensAtivos = {"Dina":true,"Mimi":false,"Professora":true}
	GameController.setDialogo(dialogos,pessoas)
	chamarDialogo()
	
func startPuzzleRelogio():
	var puzzle = preRelogio.instance()
	add_child(puzzle)

func finalizarPuzzleRelogio():
	#chamar pos puzzle
	posPuzzle = true
	falaIndex = 0
	var dialogos = ["posRelogio1","posRelogio2","posRelogio3","posRelogio4","posRelogio5"]
	var pessoas = ["Dina","Mimi","Dina","Mimi","Dina"]
	personagensAtivos = {"Dina":true,"Mimi":true,"Professora":false}
	GameController.setDialogo(dialogos,pessoas)
	chamarDialogo()

func startPuzzleTesouro():
	var puzzle = preTesouro.instance()
	add_child(puzzle)
	$Background.visible = false
	$Bilhetes/Mirante.visible = false

func finalizarPuzzleTesouro():
	$Bilhetes/Mirante.queue_free()
	$Background.visible = true
	$Bilhetes/Mirante.visible = true
	$Personagens/Mimi.position = $Personagens/PositionMimi2.position
	$Personagens/Mimi.scale.x = 0.03
	$Personagens/Mimi.scale.y = 0.03
	posPuzzle = true
	var dialogos = ["posCristo1","posCristo2"]
	var pessoas = ["Dina", "Dina"]
	personagensAtivos = {"Dina":true,"Mimi":true,"Professora":false}
	GameController.setDialogo(dialogos,pessoas)
	chamarDialogo()
	
func finalizarDialogo():
	posPuzzle = false
	var dial = get_tree().get_nodes_in_group("dialogo")
	for dialog in dial:
		dialog.queue_free()
	
	estagio += 1
	falaIndex = 0
	
	esconderPersonagens()
	if estagio == 0:
		$Personagens/Dina.position = Vector2(432,357)
		var bg = load("res://sprites/garanhuns/escola 1.2.png")
		$Background.texture = bg
		$Background2.visible = true
		var dialogos = ["preCaixa2","preCaixa3","preCaixa4"]
		var pessoas = ["Professora","Dina","Professora"]
		GameController.setDialogo(dialogos,pessoas)
		personagensAtivos = {"Dina":true,"Mimi":false,"Professora":true}
		chamarDialogo()
	elif estagio == 1:
		startPuzzleEnigma()
	elif estagio == 2:
		$Bilhetes/BilheteFechado.queue_free()
		$Background2.visible = false
		var bg = load("res://sprites/garanhuns/casa.png")
		$Background.texture = bg
		$Personagens/Dina.position = $Personagens/PositionDinaGeral.position
		
		$Bilhetes/HoraCerta.visible = true
		
		var dialogos = ["casa1","casa2","casa3","casa4"]
		var pessoas = ["Dina","Dina","Mimi","Dina"]
		personagensAtivos = {"Dina":true,"Mimi":true,"Professora":false}
		GameController.setDialogo(dialogos,pessoas)
		#Chamar foto do bilhete
		chamarDialogo()
	elif estagio == 3:
		var bg = load("res://sprites/garanhuns/relogioflores.png")
		$Background.texture = bg
		$Personagens/Mimi.position = $Personagens/PositionMimiRelogio.position
		var dialogos = ["preRelogio1","preRelogio2","preRelogio3"]
		var pessoas = ["Dina","Mimi","Dina"]
		personagensAtivos = {"Dina":true,"Mimi":true,"Professora":false}
		GameController.setDialogo(dialogos,pessoas)
		chamarDialogo()
	elif estagio == 4:
		$Bilhetes/HoraCerta.visible = false
		$Timer.start()
		ativarPersonagens()
		
	elif estagio == 5:
		var bg = load("res://sprites/garanhuns/relogioflores2.png")
		$Background.texture = bg
		var dialogos = ["horaRelogio1","horaRelogio2","horaRelogio3"]
		var pessoas = ["Dina","Mimi","Dina"]
		personagensAtivos = {"Dina":true,"Mimi":true,"Professora":false}
		GameController.setDialogo(dialogos,pessoas)
		chamarDialogo()
	elif estagio == 6:
		startPuzzleRelogio()
	elif estagio ==7:
		$Personagens/Mimi.position = $Personagens/PositionMimi3.position
		$Background.texture = load("res://sprites/garanhuns/cristo.png")
		$Bilhetes/Mirante.visible = true
		$Timer.start()
	elif estagio == 8:
		#$Bilhetes/AoSul.queue_free()
		var dialogos = ["preCristo1","preCristo2","preCristo3","preCristo4","preCristo5","preCristo6","preCristo7"]
		var pessoas = ["Mimi","Dina","Dina","Mimi","Mimi","Dina","Mimi"]
		personagensAtivos = {"Dina":true,"Mimi":true,"Professora":false}
		GameController.setDialogo(dialogos,pessoas)
		chamarDialogo()
	elif estagio == 9:
		$Bilhetes/AoSul.queue_free()
		startPuzzleTesouro()
	elif estagio == 10:
		$Bilhetes/Passaporte.visible = true
		var dialogos = ["posCristo3","posCristo4","posCristo5","posCristo6","posCristo7","posCristo8","posCristo9"]
		var pessoas = ["Professora", "Dina","Professora", "Professora", "Dina", "Mimi", "Dina"]
		personagensAtivos = {"Dina":true,"Mimi":true,"Professora":true}
		GameController.setDialogo(dialogos,pessoas)
		chamarDialogo()
	elif estagio == 11:
		personagensAtivos = {"Dina":true,"Mimi":true,"Professora":false}
		ativarPersonagens()
		$Personagens/Dina/AnimationPlayerDina.play("destacar")
		$Personagens/Mimi/AnimationPlayerMimi.play("destacar")
		$Personagens/AnimGeral.play("sumir")
	else:
		GameController.finalizarGaranhuns()
		#Tela de Vitória
		#get_tree().change_scene("res://scenes/mapa/Mapa.tscn")
		get_tree().change_scene("res://scenes/Creditos.tscn")

func esconderPersonagens():
	$Personagens/Dina.visible = false
	$Personagens/Mimi.visible = false
	$Personagens/Professora.visible = false
	
func ativarPersonagens():
	$Personagens/Dina.visible = personagensAtivos["Dina"]
	$Personagens/Mimi.visible = personagensAtivos["Mimi"]
	$Personagens/Professora.visible = personagensAtivos["Professora"]
	
func dialogando(per):
	if per == personagemFalando:
		return
	
	if per == "Dina":
		$Personagens/Dina/AnimationPlayerDina.play("destacar")
		$Personagens/Mimi/AnimationPlayerMimi.play("esmaecer")
		$Personagens/Professora/AnimationPlayer.play("esmaecer")
	elif per == "Mimi":
		$Personagens/Dina/AnimationPlayerDina.play("esmaecer")
		$Personagens/Mimi/AnimationPlayerMimi.play("destacar")
		$Personagens/Professora/AnimationPlayer.play("esmaecer")
	elif per == "Professora":
		$Personagens/Dina/AnimationPlayerDina.play("esmaecer")
		$Personagens/Mimi/AnimationPlayerMimi.play("esmaecer")
		$Personagens/Professora/AnimationPlayer.play("destacar")
	personagemFalando = per
		


func _on_AnimGeral_animation_finished(anim_name):
	finalizarDialogo()


func _on_Timer_timeout():
	self.timeout = true
	finalizarDialogo()

func fecharDica():
	$StaticDicas/Dicas.visible = false
	
func chamarDica(puzzle):
	$StaticDicas/Dicas.ativar(puzzle)
	$StaticDicas/Dicas.visible = true


func _on_Config_pressed():
	$StaticDicas/WindowDialog.popup()
	

func _on_ButtonMenu_pressed():
	$StaticDicas/AcceptDialog.popup()


func _on_AcceptDialog_confirmed():
	get_tree().change_scene("res://scenes/menu/MenuInicial.tscn")


func _on_ButtonFullscreen_pressed():
	$StaticDicas/WindowDialog/ButtonFullscreen.pressed = !$StaticDicas/WindowDialog/ButtonFullscreen.pressed
	OS.window_fullscreen = !OS.window_fullscreen
