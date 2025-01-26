extends Node2D

var SPEED = 60

var direction = -1

@onready var ray_cast_left = $RayCastLeft
@onready var ray_cast_right = $RayCastRight

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ray_cast_right.is_colliding():
		direction = -1
	if ray_cast_left.is_colliding():
		direction = 1
	
	
	
	position.x += SPEED * delta * direction
