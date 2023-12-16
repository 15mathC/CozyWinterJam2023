extends ProgressBar

@export var player: PlayerSnowball
# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_parent().get_parent().get_node("PlayerSnowball");
	player.healthChange.connect(_update)

	_update()
	pass # Replace with function body.

func _update():
	value = player.currentHealth * 100 / player.maxHealth
	var val = value * 2 / player.maxHealth + .5
	player.scale = Vector2(val, val)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
