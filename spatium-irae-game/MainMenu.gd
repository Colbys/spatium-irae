extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	set_process(true)

func _process(delta):
	if Input.is_action_just_pressed("game_action"):
		get_tree().change_scene("res://Scene.tscn")
