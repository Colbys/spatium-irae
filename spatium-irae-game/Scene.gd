extends Node

export (PackedScene) var Mob

onready var enemy_timer = get_node("EnemyTimer")
onready var enemy_spawn_location = get_node("EnemyPath/EnemySpawnLocation")

func _ready():
	randomize()
	enemy_timer.start()

func _on_EnemyTimer_timeout():
	enemy_spawn_location.set_offset(randi())
	if enemy_spawn_location.position.y < 360:
		enemy_spawn_location.position.y = 0
		enemy_spawn_location.rotation = 0
	else:
		enemy_spawn_location.position.y = 720
		enemy_spawn_location.rotation = PI
	# print("Position: ", enemy_spawn_location.position)
	# print("Rotation: ", enemy_spawn_location.rotation)
	#var mob = Mob.instance()
	#add_child(mob)
	#var direction = enemy_spawn_location.rotation + PI / 2
	#mob.position = enemy_spawn_location.position
	#direction += rand_range(-PI / 4, 0) if enemy_spawn_location.position.y == 720 else rand_range(0, PI / 4)
	#mob.rotation = direction
	#mob.set_linear_velocity(Vector2(rand_range(mob.min_speed, mob.max_speed), 0).rotated(direction))
