extends Sprite

func _ready():
	set_physics_process(true)

func _physics_process(delta):
	self.rotate(0.05)
