extends CharacterBody2D
 
@export var move_speed : float = 200
@export var starting_direction : Vector2 = Vector2(0, 1)
#parameters/Idle/blend_position
 
@onready var animation_tree = $AnimationTree
 
@onready var dead : bool = false

func set_death(value):
	dead = value
	print("value set")

func _ready():
	update_animation_parameters(starting_direction, dead)
 
func _physics_process(_delta):
	var input_direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)
	#if update_animation_parameters(input_direction, dead) == true put dead
	update_animation_parameters(input_direction, dead)
	velocity = input_direction * move_speed
	move_and_slide()
 
func update_animation_parameters(move_input : Vector2, is_dead : bool):
	if is_dead:
		animation_tree.set("parameters/dead/blend_position", move_input)
		return true
	else:
		if (move_input != Vector2.ZERO):
			animation_tree.set("parameters/Walk/blend_position", move_input)
		animation_tree.set("parameters/Idle/blend_position", move_input)
		return true
