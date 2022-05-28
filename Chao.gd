extends StaticBody2D

var num = -1

func _ready():
	pass

func setLabel(n):
	$Label.text = n
	if n != "":
		num = int(n)
	else:
		num = -1

func getLabel():
	return num


func _on_Area2D_body_entered(body):
	if num == 64:
		get_parent().posCorreta = true
	else:
		get_parent().posCorreta = false


func _on_Area2D_body_exited(body):
	if num == 64:
		get_parent().posCorreta = false
