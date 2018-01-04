extends KinematicBody2D

var bulletSprite
var wait_time = 0.0
var end_time = 0.3

func _ready():
	set_process(true)
	bulletSprite = get_node( "Sprite" )
	pass

func _process(delta):
	var bulletDirection = global.global_direction
	if bulletDirection == -1:
		bulletSprite.set_flip_h( true )
		translate(Vector2(-20,0))
	else:
		bulletSprite.set_flip_h( false )
		translate(Vector2(20,0))
	
	wait_time += delta
	if wait_time > end_time:
		wait_time = 0.0
		destroy()

func destroy():
    queue_free()