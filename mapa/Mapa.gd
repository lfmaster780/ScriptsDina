extends Node2D


func _ready():
	if GameController.agreste["buique"]:
		$ButtonBuique.visible = true
		$ButtonBuique.text = "BuiqueC"
	
	if GameController.agreste["caruaru"]:
		$ButtonCaruaru.visible = true
		$ButtonCaruaru.text = "CaruaruC"
	
	if GameController.agreste["garanhuns"]:
		$ButtonGaranhuns.text = "GusC"
		$ButtonCaruaru.visible = true
		$ButtonBuique.visible = true
	


func _on_ButtonVoltar_pressed():
	get_tree().change_scene("res://scenes/menu/MenuInicial.tscn")


func _on_ButtonGaranhuns_pressed():
	get_tree().change_scene("res://scenes/garanhuns/MainGaranhuns.tscn")


func _on_Area2D_mouse_entered():
	$CidadeLabel.visible = true


func _on_Area2D_mouse_exited():
	$CidadeLabel.visible = false
