extends Node2D


func _ready():
	pass


func _on_ButtonVoltar_pressed():
	get_tree().change_scene("res://scenes/menu/MenuInicial.tscn")

func _input(event):
	if event.is_action_pressed("ui_accept"):
		get_tree().change_scene("res://scenes/menu/MenuInicial.tscn")
