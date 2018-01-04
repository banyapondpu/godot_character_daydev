extends KinematicBody2D

var input_direction = 0
var direction = 0
var speed = 0
var velocity = 0
const MAX_SPEED = 600
const ACCELERATION = 1000
const DECELERATION = 2000

func _ready():
	set_process(true)
	pass

func _process(delta):
	if input_direction:
		direction = input_direction
	
	if Input.is_action_pressed("ui_left"):
		input_direction = -1
		get_node( "AnimatedSprite" ).set_flip_h( true )
		get_node("AnimatedSprite").play("walk")		
	elif Input.is_action_pressed("ui_right"):
		input_direction = 1
		get_node( "AnimatedSprite" ).set_flip_h( false )
		get_node("AnimatedSprite").play("walk")		
	else:
		input_direction = 0
		get_node("AnimatedSprite").play("default")
	
	# MOVEMENT
	if input_direction == - direction:
		speed /= 3

	if input_direction:
		speed += ACCELERATION * delta
	else:
		speed -= DECELERATION * delta

	speed = clamp(speed, 0, MAX_SPEED)
	
	velocity = speed * delta * direction
	move(Vector2(velocity, 0))
	
	
	
	pass