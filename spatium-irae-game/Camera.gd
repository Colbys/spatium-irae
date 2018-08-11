extends Camera2D

onready var player = get_node("../player")

func _ready():
	position = player.position
	set_process(true)

func _process(delta):
	position = player.position
	pass
