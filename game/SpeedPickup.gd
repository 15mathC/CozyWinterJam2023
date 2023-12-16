extends "res://Pickup.gd"


@export var boost_speed = 35


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func player_collision(player):
	player.speed = boost_speed
	self.queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
