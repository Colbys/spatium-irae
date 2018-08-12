extends RigidBody2D

export (int) var min_speed # Minimum speed range.
export (int) var max_speed # Maximum speed range.

onready var sprite = get_node("Sprite")

func _ready():
	set_physics_process(true)

func _physics_process(delta):
	sprite.rotate(0.05)

func _on_Visibility_screen_exited():
    queue_free()

func _on_Kamikaze_body_entered(body):
	queue_free()
