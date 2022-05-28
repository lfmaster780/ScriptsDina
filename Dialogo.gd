extends Control

const SPEED = 0.025
var falas = []
var pessoa = []

var falaIndex = 0
var falaTerminada = false

func _ready():
	pass

func _process(delta):
	$Next.visible = falaTerminada
	get_parent().get_parent().falaIndex = falaIndex

func iniciar():
	falas = GameController.dialogos
	pessoa = GameController.personagens
	dialogar()
	
func _input(event):
	if event.is_action_pressed("ui_accept"):
		if falaIndex < falas.size() and falaTerminada:
			dialogar()
		elif falaTerminada == false and falaIndex <= falas.size():
			$Tween.stop_all()
			$Texto.percent_visible = 1
			self.falaTerminada = true
		else:
			get_parent().get_parent().finalizarDialogo()
			

func dialogar():
	get_parent().get_parent().dialogando(pessoa[falaIndex])
	falaTerminada = false
	$LabelPersonagem.text = pessoa[falaIndex]
	var fala = tr(falas[falaIndex])
	$Texto.bbcode_text = fala
	$Texto.percent_visible = 0
	var tweenVelocidade = SPEED * fala.length()
	$Tween.interpolate_property($Texto, "percent_visible", 0 , 1, tweenVelocidade,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT)
	$Tween.start()
	falaIndex += 1

func _on_Tween_tween_completed(object, key):
	self.falaTerminada = true
