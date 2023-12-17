extends Node3D

@export var time_seconds: float = 60;
@export var start_up_time: float = 4
var is_game_over: bool = false
var _game_time: float

func start_up_sequence(time: float):
	if time < (time_seconds - 1):
		$GameWorld/PlayerSnowball/Camera3D/StartLabel.visible = false
		return
	var text_scale = time - int(time)
	var text = str(int(time - time_seconds) + 1)
	if time < time_seconds:
		text = "GROW!"
	$GameWorld/PlayerSnowball/Camera3D/StartLabel.text = text
	$GameWorld/PlayerSnowball/Camera3D/StartLabel.scale = Vector3(1, 1, 1) * (1 + text_scale)


# Called when the node enters the scene tree for the first time.
func _ready():
	_game_time = time_seconds + start_up_time
	

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
	if _game_time <= 0 and not is_game_over:
		is_game_over = true
		end_game()
	elif not is_game_over:
		_game_time -= delta
		start_up_sequence(_game_time)
		$GameWorld/PlayerSnowball/Camera3D/TimeLabel.text = "Time: %.01f" % _game_time
