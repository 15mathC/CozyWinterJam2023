extends StaticBody3D

@export var size: float
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func player_collision(player):
	player.fire()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
