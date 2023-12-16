extends StaticBody3D

@export var rotation_speed = 2


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func player_collision(player):
	pass
	

func _physics_process(delta):
	$Sprite3D.rotate_y(rotation_speed * delta)
