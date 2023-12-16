extends CharacterBody2D

class_name PlayerSnowball

var i = 0
const SPEED = 100.0
const JUMP_VELOCITY = -400.0
@export var currentHealth = 50
@export var maxHealth = 100
var damageHealthModifier = .1

signal healthChange()

func get_input():
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * SPEED

func eat_snow():
	currentHealth = currentHealth + 5
	healthChange.emit()

func damage_health():
	currentHealth = currentHealth - damageHealthModifier
	healthChange.emit()
	
func collectSnowflake():
	eat_snow()

func _physics_process(delta):
	get_input()

	move_and_slide()
	damage_health()







func _on_area_2d_area_entered(area):
	print(area)
	pass # Replace with function body.
