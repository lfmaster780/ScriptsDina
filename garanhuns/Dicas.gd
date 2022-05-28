extends Node2D

var puzzle = -1

func _ready():
	pass


func _on_BotaoVoltar_pressed():
	if puzzle == 3:
		self.visible = false
		$P1.visible = false
		$P2.visible = false
		$P3.visible = false
		return
	get_parent().get_parent().fecharDica()
	$P1.visible = false
	$P2.visible = false
	$P3.visible = false
	
func ativar(p):
	puzzle = p
	if p == 1:
		$P1.visible = true
		$P2.visible = false
		$P3.visible = false
	
	elif p == 2:
		$P1.visible = false
		$P2.visible = true
		$P3.visible = false
		
	else:
		$P1.visible = false
		$P2.visible = false
		$P3.visible = true
