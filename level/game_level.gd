extends Node2D

var move_speed : float = 200
var moving = false

var destination_position = Vector2($DestinationPosition.global_position.x, $DestinationPosition.global_position.y)

func go_there(delta):
	if moving :
		$Chien.global_position = $Chien.global_position.move_toward(destination_position, delta * move_speed)
	if ($Chien.global_position == destination_position):
		moving = false
		#return initial position

func _process(delta):
	go_there(delta)
	if $Player.global_position == $Chien.global_position:
		moving = true
