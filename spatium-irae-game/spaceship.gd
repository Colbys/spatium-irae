extends Area2D

var speed = 0.0
var acceleration = 100.0

var velocity = Vector2()

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	set_process(true)

func _process(delta):
	handle_controls()
	position += velocity * delta

func handle_controls():
	if (Input.is_action_pressed("game_action")):
		velocity.x += 1
	if (Input.is_action_just_released("game_action")):
		velocity.x = 0