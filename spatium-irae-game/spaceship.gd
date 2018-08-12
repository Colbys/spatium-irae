extends Area2D

var speed = 0 # 400
var acceleration = 6
var spacebarLimit = 8

var trottle = 0
var trottleAcceleration = 4
var trottleWarning = 750
var trottleLimit = 1000

var actionKey = "game_action"

var is_playable = true

var velocity = Vector2(speed, 0)

func _ready():
	set_physics_process(true)

func _physics_process(delta):
	self.handle_controls()
	self.handle_death()
	position += velocity * delta

func handle_controls():
	if (Input.is_action_just_pressed(actionKey) && spacebarLimit >= 0):
		spacebarLimit -= 1
		velocity.x += 100
		print(spacebarLimit)
	if (Input.is_action_pressed(actionKey) && spacebarLimit >= 0):
		velocity.x += acceleration
		trottle += trottleAcceleration
	if (!Input.is_action_pressed(actionKey) && velocity.x != 0):
		velocity.x -= acceleration
		if (trottle > 0):
			trottle -= trottleAcceleration * 2
		else:
			trottle = 0

func handle_logging():
	print("Speed: ", velocity.x)
	print("Trottle: ", trottle)

func handle_death():
	if (trottle >= trottleLimit):
		self.queue_free()
		get_tree().reload_current_scene()
	elif (velocity.x <= 0 and spacebarLimit <= 0):
	    self.queue_free()
	    get_tree().reload_current_scene()

func _on_player_body_entered(body):
	if body.get_class() == "RigidBody2D":
		get_tree().reload_current_scene()
