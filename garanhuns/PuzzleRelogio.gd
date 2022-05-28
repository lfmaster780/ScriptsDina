extends Node2D

var hora = 1
var minuto = 0

func _ready():
	pass

func horaCheck():
	if hora == 4 and minuto == 0:
		return true
	else:
		return false

func _on_Confirmar_pressed():
	if horaCheck():
		get_parent().finalizarPuzzleRelogio()
		queue_free()
	else:
		$PopupErro.popup()
		pass

func _on_HoraCima_pressed():
	if hora > 11:
		hora = 1
		$Hora.text = "01"
	else:
		hora += 1
		if hora < 10:
			$Hora.text = "0"+str(hora)
		else:
			$Hora.text = str(hora)

func _on_MinCima_pressed():
	if minuto == 55:
		minuto = 0
		$Minuto.text = "00"
	else:
		minuto += 5
		if minuto >= 10:
			$Minuto.text = str(minuto)
		else:
			$Minuto.text = "0"+str(minuto)
		
func _on_HoraBaixo_pressed():
	if hora < 2:
		hora = 12
		$Hora.text = str(hora)
	else:
		hora -= 1
		if hora < 10:
			$Hora.text = "0"+str(hora)
		else:
			$Hora.text = str(hora)

func _on_MinBaixo_pressed():
	if minuto == 0:
		minuto = 55
		$Minuto.text = str(minuto)
	else:
		minuto -= 5
		if minuto < 10:
			$Minuto.text = "0"+str(minuto)
		else:
			$Minuto.text = str(minuto)


func _on_BotaoDuvida_pressed():
	get_parent().chamarDica(2)
	
