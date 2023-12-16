extends StaticBody3D

@export var size: float = 1.0
@export var growth_amount: float = 0.1


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func player_collision(player):
	if player.size < size:
		player.reset_position()
	else:
		player.grow(growth_amount)
		self.queue_free()
