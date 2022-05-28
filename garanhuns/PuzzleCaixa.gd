extends Node2D

var mousePermitido = true
var mousePermitido2 = true
var sequencia = [3,4,5,6,7,8]

var aberto = false
var valores = [3,3,3,3]

func _ready():
	pass

func next(pos):
	var num = valores[pos]
	
	if num == 3:
		
		valores[pos] += 1
		if pos == 0:
			$Caixa/Fita1.play("next3")
		elif pos == 1:
			$Caixa/Fita2.play("next3")
		elif pos == 2:
			$Caixa/Fita3.play("next3")
		else:
			$Caixa/Fita4.play("next3")
	elif num == 4:
		#AnimQuadrado
		valores[pos]+=1
		if pos == 0:
			$Caixa/Fita1.play("next4")
		elif pos == 1:
			$Caixa/Fita2.play("next4")
		elif pos == 2:
			$Caixa/Fita3.play("next4")
		else:
			$Caixa/Fita4.play("next4")
	elif num == 5:
		#AnimPenta
		valores[pos]+=1
		if pos == 0:
			$Caixa/Fita1.play("next5")
		elif pos == 1:
			$Caixa/Fita2.play("next5")
		elif pos == 2:
			$Caixa/Fita3.play("next5")
		else:
			$Caixa/Fita4.play("next5")
	elif num == 6:
		#animHexa
		valores[pos]+=1
		if pos == 0:
			$Caixa/Fita1.play("next6")
		elif pos == 1:
			$Caixa/Fita2.play("next6")
		elif pos == 2:
			$Caixa/Fita3.play("next6")
		else:
			$Caixa/Fita4.play("next6")
	elif num == 7:
		#animHept
		valores[pos]+=1
		if pos == 0:
			$Caixa/Fita1.play("next7")
		elif pos == 1:
			$Caixa/Fita2.play("next7")
		elif pos == 2:
			$Caixa/Fita3.play("next7")
		else:
			$Caixa/Fita4.play("next7")
	else:
		#Anim Oct
		valores[pos] = 3
		if pos == 0:
			$Caixa/Fita1.play("next8")
		elif pos == 1:
			$Caixa/Fita2.play("next8")
		elif pos == 2:
			$Caixa/Fita3.play("next8")
		else:
			$Caixa/Fita4.play("next8")
		
	#EXTRA PRA TESTE
	#self.valores = [3,6,4,3]
	checar()

func checar():
	if self.valores == [3,6,4,3]:
		aberto = true
		$Caixa/Button1.disabled = true
		$Caixa/Button2.disabled = true
		$Caixa/Button3.disabled = true
		$Caixa/Button4.disabled = true
		$Abrir.visible = true

func _on_Abrir_pressed():
	get_parent().finalizarEnigma()
	queue_free()

func _on_Button1_pressed():
	next(0)

func _on_Button2_pressed():
	next(1)

func _on_Button3_pressed():
	next(2)

func _on_Button4_pressed():
	next(3)


func _on_Area_mouse_entered():
	mousePermitido = false

func _on_Area_mouse_exited():
	mousePermitido = true

func _on_Area_area_entered(area):
	if area.is_in_group("papel"):
		mousePermitido2 = false

func _on_Area_area_exited(area):
	if area.is_in_group("papel"):
		mousePermitido2 = true


func _on_BotaoDuvida_pressed():
	get_parent().chamarDica(1)
