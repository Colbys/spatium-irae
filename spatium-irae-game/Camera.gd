extends Camera2D

var camera_position = Vector2()

onready var player = get_node("../player")
onready var scene = get_node("../../Scene")

func _ready():
	camera_position = player.position
	set_process(true)

func _process(delta):
	if (scene.has_node("player")):
		camera_position = player.position
	position = camera_position
	pass
