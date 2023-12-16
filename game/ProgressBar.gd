extends ProgressBar

var player: PlayerSnowball

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_parent().get_parent().get_node("./GameWorld/PlayerSnowball")
	player.playerGrow.connect(_updateUi)
	pass # Replace with function body.

func _updateUi():
	value = player.size * 100
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
