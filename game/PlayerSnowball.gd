extends AnimatableBody3D

@export var playerVisual: Node3D
@export var speed: float = 10
@export var dashspeed: float = 50
var size = 0
var _old_pos = Vector3(0,0,0)
var _initial_pos = Vector3(0,0,0)


# Called when the node enters the scene tree for the first time.
func _ready():
	playerVisual = $Snowball as Node3D
	_initial_pos = position
	
	
func grow(amount: float):
	size += amount
	scale += Vector3(amount, amount, amount)
	position.y = size + _initial_pos.y
	
func reset_position():
	position.x = _old_pos.x
	position.z = _old_pos.z


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	_old_pos = position
	var motion = Vector3(0, 0, 0)
	if Input.is_action_pressed("move right"):
		playerVisual.rotate_z(-speed * delta)
		motion.x = speed
	if Input.is_action_pressed("move left"):
		playerVisual.rotate_z(speed * delta)
		motion.x = -speed
	if Input.is_action_pressed("move up"):
		playerVisual.rotate_x(-speed * delta)
		motion.z = -speed
	if Input.is_action_pressed("move down"):
		playerVisual.rotate_x(speed * delta)
		motion.z = speed
	if Input.is_action_pressed("sprint"):
		speed = dashspeed
	if Input.is_action_just_released("sprint"):
		speed = 10
	translate(motion * delta)
	var collision = move_and_collide(Vector3(0, 0, 0), true, 0.001, false, 25)
	if collision:
		for i in range(collision.get_collision_count()):
			var coll = collision.get_collider(i)
			print("collided with")
			print(coll)
			if coll is GridMap:
				var grid = coll
				var pos =  collision.get_position(i)

				#pos = self.to_local(pos)

				var gridPos = grid.local_to_map  ( pos )
				print(gridPos)
				var item = grid.get_cell_item( Vector3(gridPos.x, .001, gridPos.z))
				print(item)
				if(item == 0):
					self.grow(0.01)
					grid.set_cell_item(Vector3(gridPos.x, .001, gridPos.z), 1)
			else:
				coll.player_collision(self)
