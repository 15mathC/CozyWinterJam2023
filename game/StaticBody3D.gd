extends StaticBody3D

@export var size: float
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func player_collision(player):
	if player.size < size:
		player.reset_position()
	else:
		self.queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
