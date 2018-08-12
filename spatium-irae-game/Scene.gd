extends Node

export (PackedScene) var Mob

onready var player = get_node("player")
onready var gui = get_node("Camera/GUI")

onready var game_end_timer = get_node("GameEndTimer")
onready var enemy_timer = get_node("EnemyTimer")
onready var enemy_spawn_location = get_node("EnemyPath/EnemySpawnLocation")

func _ready():
	randomize()
	enemy_timer.start()
	set_process(true)

func _process(delta):
	if player.game_over:
		get_tree().change_scene("res://GameOver.tscn")

func _on_EnemyTimer_timeout():
	enemy_spawn_location.set_offset(randi())
	if enemy_spawn_location.position.y < 360:
		enemy_spawn_location.position.y = 0
		enemy_spawn_location.rotation = 0
	else:
		enemy_spawn_location.position.y = 720
		enemy_spawn_location.rotation = PI
	var mob = Mob.instance()
	add_child(mob)
	var direction = enemy_spawn_location.rotation + PI / 2
	mob.position = enemy_spawn_location.position
	direction += rand_range(PI / 12, -PI / 6) if enemy_spawn_location.position.y == 720 else rand_range(-PI / 12, PI / 6)
	mob.rotation = direction
	mob.set_linear_velocity(Vector2(rand_range(mob.min_speed, mob.max_speed), 0).rotated(direction))

func _on_Trigger_area_shape_entered(area_id, area, area_shape, self_shape):
	gui.hide()
	player.is_playable = false
	player.velocity.x = 100

func _on_PortalTrigger_area_shape_entered(area_id, area, area_shape, self_shape):
	player.velocity.x = 0
	game_end_timer.start()

func _on_GameEndTimer_timeout():
	get_tree().change_scene("res://GameComplete.tscn")
