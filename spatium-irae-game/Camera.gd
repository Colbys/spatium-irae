extends Camera2D

var camera_position = Vector2()
var camera_offset = Vector2()

onready var player = get_node("../player")
onready var scene = get_node("../../Scene")

func _ready():
	camera_offset.x = -200
	camera_position = player.position
	camera_position -= camera_offset
	set_process(true)

func _process(delta):
	if (scene.has_node("player")):
		camera_position = player.position
		camera_position -= camera_offset
	position = camera_position
	pass
