extends Area2D

var init
var selected = false
var setence
#y 118 / x 124
var size
var mouse
var y
var x
func _ready():
	init = global_position

func _physics_process(delta):
	if get_parent().mousePermitido2 and get_parent().mousePermitido:
		#init = global_position
		pass
		
	if selected and get_parent().mousePermitido2 and get_parent().mousePermitido:
		global_position = lerp(global_position, get_global_mouse_position(),25*delta)
	if not get_parent().mousePermitido2:
		global_position = lerp(global_position, init,25*delta)

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and not event.pressed:
			selected = false

func _on_PapelEnigma_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		selected = true
