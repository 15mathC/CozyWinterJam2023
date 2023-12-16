extends StaticBody3D

@export var snowTexture: Texture2D
@export var groundTexture: Texture2D
@export var growthAmount: float = 0.1

var state = "SNOW"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func player_collision(player):
	if state == "SNOW":
		state = "GROUND"
		var sprite = $Sprite3D as Sprite3D
		sprite.texture = groundTexture
		player.grow(growthAmount)
