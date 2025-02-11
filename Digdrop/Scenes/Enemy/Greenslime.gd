extends Node2D

var SPEED = 20

var direction = -1

@onready var player = get_parent().get_node("player")

const goopGuck = preload("res://Scenes/Enemy/goopGuck.tscn");

@onready var game = get_tree().get_root();
@onready var ray_cast_left = $RayCastLeft
@onready var ray_cast_right = $RayCastRight


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ray_cast_right.is_colliding() == true or $RayCastDownRight.is_colliding() == false:
		direction = -1
	if ray_cast_left.is_colliding() == true or $RayCastDownLeft.is_colliding() == false:
		direction = 1
	position.x += SPEED * delta * direction
	
	#if player.position < 500:
		#shoot_goop()

func shoot_goop():
	var goopShoot = goopGuck.instantiate();
	game.addchild(goopShoot);
	


	
	
	
	
