extends Node2D


func _ready():
	if GameController.jogoAtivo:
		$ButtonContinuar.visible = true


func _on_ButtonNovoJogo_pressed():
	GameController.novoJogo()
	GameController.jogoAtivo = true
	get_tree().change_scene("res://scenes/mapa/Mapa.tscn")


func _on_ButtonContinuar_pressed():
	get_tree().change_scene("res://scenes/mapa/Mapa.tscn")


func _on_ButtonFullScreen_pressed():
	$ButtonFullScreen.pressed = !$ButtonFullScreen.pressed
	OS.window_fullscreen = !OS.window_fullscreen


func _on_ButtonCreditos_pressed():
	get_tree().change_scene("res://scenes/Creditos.tscn")


func _on_BotaoSair_pressed():
	get_tree().quit()
