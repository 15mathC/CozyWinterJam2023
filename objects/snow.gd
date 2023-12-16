extends Sprite2D

class_name SimpleSnowflake


var playerBody

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _destroy():
	queue_free()
	pass
	
func _magnet_to_body(body):
	playerBody = body
	pass
	
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_collection_zone_body_entered(body):
	if(body.has_method("collectSnowflake")):
		body.collectSnowflake();
		_destroy()
		
	pass # Replace with function body.


func _on_magnet_zone_body_entered(body):
	print(body)
	if(body.has_method("collectSnowflake")):
		_magnet_to_body(body)
	pass # Replace with function body.


func _on_magnet_zone_area_entered(area):
	print(area)
	if(area.has_method("collectSnowflake")):
		_magnet_to_body(area)
	pass # Replace with function body.


func _on_collection_zone_area_entered(area):
	print(area)
	if(area.has_method("collectSnowflake")):
		area.collectSnowflake();
		_destroy()
	pass # Replace with function body.
