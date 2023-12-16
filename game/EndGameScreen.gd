extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
	
func set_score(score: int):
	$"Score Text".text = "Score: " + str(score)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
