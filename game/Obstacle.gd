extends StaticBody3D

@export var size: float = 1.0
@export var growth_amount: float = 0.

var _initial_scale: Vector3
var _initial_pos: Vector3
var _pickup_size: float = 0.0
var _player: Node3D

var is_picked_up = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func player_collision(player):
	if player.size < size:
		player.reset_position()
	elif not is_picked_up:
		is_picked_up = true
		player.grow(growth_amount)
		self.reparent(player.get_node("Snowball"))
		_initial_scale = scale
		_initial_pos = position
		_player = player
		_pickup_size = player.size
		growth_amount = 0
		
func _process(delta):
	if is_picked_up:
		var adjusted_scale = (_pickup_size)/_player.size
		scale = _initial_scale * adjusted_scale
		position = _initial_pos * adjusted_scale
