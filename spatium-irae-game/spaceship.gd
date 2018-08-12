extends Area2D

var speed = 0 # 400
var acceleration = 5
var spacebarLimit = 21

var trottle = 0
var trottleAcceleration = 4
var trottleWarning = 750
var trottleLimit = 1000

var actionKey = "game_action"

var ableAction = false
var is_playable = true
var game_over = false

var velocity = Vector2(speed, 0)

func _ready():
	set_physics_process(true)

func _physics_process(delta):
	self.handle_controls()
	self.handle_death()
	position += velocity * delta

func handle_controls():
	if is_playable:
		if (Input.is_action_just_pressed(actionKey) && spacebarLimit > 0):
			spacebarLimit -= 1
			velocity.x += 100
			ableAction = true
		if (Input.is_action_pressed(actionKey) && spacebarLimit >= 0 && ableAction):
			velocity.x += acceleration
			trottle += trottleAcceleration
		if ((!Input.is_action_pressed(actionKey) && velocity.x != 0) || (spacebarLimit == 0 && !ableAction)):
			velocity.x -= acceleration * 2 if velocity.x > 0 else velocity.x
			ableAction = false
			if (trottle > 0):
				trottle -= trottleAcceleration * 2
			else:
				trottle = 0

func handle_logging():
	print("Speed: ", velocity.x)
	print("Trottle: ", trottle)

func handle_death():
	if (trottle >= trottleLimit):
		game_over = true
	elif (velocity.x <= 0 and spacebarLimit <= 0):
		game_over = true

func _on_player_body_entered(body):
	if body.get_class() == "RigidBody2D":
		game_over = true
