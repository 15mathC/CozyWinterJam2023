extends AnimatableBody3D

@export var playerVisual: Node3D
@export var speed: int = 10
var size = 0
var _old_pos = Vector3(0,0,0)


# Called when the node enters the scene tree for the first time.
func _ready():
	playerVisual = $Snowball as Node3D
	
	
func grow(amount: float):
	size += amount
	scale += Vector3(amount, amount, amount)
	position.y = size
	
func reset_position():
	position.x = _old_pos.x
	position.z = _old_pos.z


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	_old_pos = position
	var motion = Vector3(0, 0, 0)
	if Input.is_action_pressed("ui_right"):
		playerVisual.rotate_z(-speed * delta)
		motion.x = speed
	if Input.is_action_pressed("ui_left"):
		playerVisual.rotate_z(speed * delta)
		motion.x = -speed
	if Input.is_action_pressed("ui_up"):
		playerVisual.rotate_x(-speed * delta)
		motion.z = -speed
	if Input.is_action_pressed("ui_down"):
		playerVisual.rotate_x(speed * delta)
		motion.z = speed
	translate(motion * delta)
	var collision = move_and_collide(motion * delta, true, 0.001, false, 25)
	if collision:
		for i in range(collision.get_collision_count()):
			collision.get_collider(i).player_collision(self)
