extends Area2D

var speed = 0 # 400
var acceleration = 2
var spacebarLimit = 8

var trottle = 0
var trottleAcceleration = 4
var trottleWarning = 750
var trottleLimit = 1000

var actionKey = "game_action"

var velocity = Vector2(speed, 0)

func _ready():
	set_process(true)

func _process(delta):
	handle_controls()
	handle_trottling()
	#handle_logging()
	handle_death()
	position += velocity * delta

func handle_controls():
	if (Input.is_action_just_pressed(actionKey) && spacebarLimit >= 0):
		spacebarLimit -= 1
		print(spacebarLimit)
	if (Input.is_action_pressed(actionKey) && spacebarLimit >= 0):
		velocity.x += acceleration
		trottle += trottleAcceleration
	if (!Input.is_action_pressed(actionKey) && velocity.x != 0):
		velocity.x -= acceleration/2 if trottle > trottleWarning else acceleration
		if (trottle > 0):
			trottle -= trottleAcceleration * 2
		else:
			trottle = 0

func handle_trottling():
	pass

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