extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func process_tile():
	var tile_position = $TileMap.local_to_map($PlayerSnowball.position)   
	$TileMap.local_to_map(position)   
	var source = $TileMap.get_cell_source_id(0, tile_position)
	if(source == 0):
		$TileMap.set_cell(0, tile_position, 1, Vector2i(0, 0))
		$PlayerSnowball.eat_snow()
	print(tile_position)
	print(source)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	process_tile()
	pass
