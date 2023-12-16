extends Node3D

@export var time_seconds: float = 10;
var is_game_over: bool = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	

func get_score():
	return int($GameWorld/PlayerSnowball.size * 1000)

func end_game():
	print("GAME OVER")
	var score = get_score()
	print("SCORE: ", score)
	remove_child($GameWorld)
	$EndGameScreen.visible = true
	$EndGameScreen.set_score(score)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if time_seconds <= 0 and not is_game_over:
		is_game_over = true
		end_game()
	elif not is_game_over:
		time_seconds -= delta
		$GameWorld/PlayerSnowball/Camera3D/TimeLabel.text = "Time: %.01f" % time_seconds
