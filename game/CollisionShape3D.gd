extends CollisionShape3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func player_collision(player):
	print("fire")
	player.fire()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
