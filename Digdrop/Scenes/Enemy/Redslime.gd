extends Node2D

var SPEED = 20

var direction = -1

var goopOnCD = false


const goopGuck = preload("res://Scenes/Enemy/goopGuck.tscn");

@onready var game = get_tree().get_root();
@onready var ray_cast_left = $RayCastLeft
@onready var ray_cast_right = $RayCastRight
@onready var goopCD = $goopCD
@onready var player = $"../Player"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ray_cast_right.is_colliding():
		direction = -1
	if ray_cast_left.is_colliding():
		direction = 1
	position.x += SPEED * delta * direction
	if player != null && goopOnCD == false:
		shoot_goop()

func shoot_goop():
	var distanceToPlayer = self.position.distance_to(player.position)
	if distanceToPlayer < 100:
		print("Kerblam!")
		goopOnCD = true
		goopCD.start()
		var goopShoot = goopGuck.instantiate();
		goopShoot.global_position = self.position
		game.add_child(goopShoot);
	
func _on_timer_timeout():
	goopOnCD = false
	pass # Replace with function body.
