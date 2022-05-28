extends Node2D

var time = 0

var preChao = preload("res://scenes/garanhuns/Chao.tscn")
var posCorreta = false

func _ready():
	instanciarChao()

func _process(delta):
	if $UI/PopupCavar.visible:
		time += delta
	else:
		time = 0
		
	if time >= 2.5:
		time = 0
		$UI/PopupCavar.visible = false
		
	$UI/Botoes.visible = !$UI/Dicas.visible

func _on_Button_pressed():
	get_parent().finalizarPuzzleTesouro()
	queue_free()


func _on_BotaoDuvida_pressed():
	$UI/Dicas.ativar(3)
	$UI/Dicas.visible = true
	
func instanciarChao():
	var x = -117
	var y = 669
	
	for i in range(7):
		var c = preChao.instance()
		x += 93
		c.position = Vector2(x,y)
		c.setLabel("")
		add_child(c)
	
	for k in range(100):
		var c = preChao.instance()
		x += 93
		c.position = Vector2(x,y)
		c.setLabel(str(k+1))
		add_child(c)
		
	for i in range(20):
		var c = preChao.instance()
		x += 93
		c.position = Vector2(x,y)
		c.setLabel("")
		add_child(c)
	
		
func finalizarCavar():
	
	if posCorreta:
		$UI/PopupCavarCerto.show()
	else:
		$UI/PopupCavar.show()


func _on_ButtonFinal_pressed():
	_on_Button_pressed()
