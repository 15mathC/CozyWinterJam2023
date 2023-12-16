extends Node3D

@export var time_seconds: float = 60;


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	

func get_score():
	return int($PlayerSnowball.size * 1000)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time_seconds -= delta
	print(time_seconds)
	if time_seconds <= 0:
		print("GAME OVER")
		print("SCORE: ", get_score())
		get_tree().quit()
