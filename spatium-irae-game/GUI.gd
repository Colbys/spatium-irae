extends MarginContainer

onready var trottle_number = get_node("UI/Bars/Bar/Count/Background/Number")
onready var trottle_bar = get_node("UI/Bars/Bar/Gauge")
onready var trottle_tween = get_node("UI/Bars/Tween")
onready var space_number = get_node("UI/Counters/Counter/Background/Number")

onready var player = get_node("../../player")
onready var scene = get_node("../../../Scene")

func _ready():
	var player_max_trottle = player.trottleLimit
	trottle_bar.max_value = player_max_trottle
	set_process(true)

func _process(delta):
	if (scene.has_node("player")):
		trottle_bar.value = player.trottle
		space_number.text = str(player.spacebarLimit)
