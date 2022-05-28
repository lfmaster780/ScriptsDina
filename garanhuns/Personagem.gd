extends KinematicBody2D

const GRAVITY = 2000
const SPEED = 330

#2d, x e y. movimentracao
var linearVelocity = Vector2(0,0)
var dir = 0
var cavando = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.

func _physics_process(delta):
	
	if not cavando:
		if $AnimatedSprite.flip_h:
			$Collision.position = $PositionEsq.position
		else:
			$Collision.position = $PositionDir.position
	
	linearVelocity.y = GRAVITY
	linearVelocity.x = SPEED * dir
	if dir == 0:
		linearVelocity.x = 0
	
	if not cavando:
		move_and_slide(linearVelocity, Vector2(0,-1))
		playAnim()

func _input(event):
	if event.is_action_pressed("ui_right"):
		dir = 1
		$AnimatedSprite.flip_h = false
	if event.is_action_pressed("ui_left"):
		dir = -1
		$AnimatedSprite.flip_h = true
	if event.is_action_released("ui_right") or event.is_action_released("ui_left"):
		dir = 0
		
	if event.is_action_pressed("ui_select") and cavando == false:
		cavar()
		 
func playAnim():
	
	if dir == 0:
		$AnimatedSprite.play("default")
	else:
		$AnimatedSprite.play("Andar")

func cavar():
	cavando = true
	$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
	$AnimatedSprite.play("Cavar")

func _on_AnimatedSprite_animation_finished():
	if cavando:
		get_parent().finalizarCavar()
		$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
		cavando = false
