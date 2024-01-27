extends CharacterBody2D

@export var move_speed : float = 100
@export var starting_direction : Vector2 = Vector2(0, 1)
 #parameters/Idle/blend_position

@onready var animation_tree = $AnimationTree

func _ready():
	update_animation_parameters(starting_direction)

func _physics_process(_delta):
	var input_direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)
	update_animation_parameters(input_direction)
	velocity = input_direction * move_speed
	move_and_slide()

func update_animation_parameters(move_input : Vector2):
	print(move_input)
	if (move_input != Vector2.ZERO):
		animation_tree.set("parameters/Walk/blend_position", move_input)
	animation_tree.set("parameters/Idle/blend_position", move_input)
		
	

#var input_movement = Vector2.ZERO
#var move_speed = 100
#@onready var animation_tree = $AnimationTree
#var anim_state = animation_tree.get("parameters/playback")
#var test = animatio_
#
#func _physics_process(_delta):
	#move()
#
#func move():
	#input_movement = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	#if (input_movement != Vector2.ZERO):
		#animation_tree.set("parameters/Idle/blend_position", input_movement)
		#animation_tree.set("parameters/Walk/blend_position", input_movement)
		#velocity = input_movement * move_speed
#
	#if (input_movement == Vector2.ZERO):
		#anim_state.travel("Idle")
		#velocity = Vector2.ZERO
	#move_and_slide()
	#
		#
