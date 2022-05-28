extends StaticBody2D

var selected = false
var setence
#y 118 / x 124
var size
var mouse
var y
var x
func _ready():
	pass

func _physics_process(delta):
	size = get_viewport_rect().size
	mouse = get_global_mouse_position()
	y = size.y >= mouse.y and mouse.y >= 0
	x = size.x >= mouse.x and mouse.x >= 0
	
	setence = y and x
	
	if not setence:
		selected = false
	if selected and get_parent().mousePermitido:
		global_position = lerp(global_position, get_global_mouse_position(),25*delta)

func _on_PapelDica_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		selected = true

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and not event.pressed:
			selected = false

