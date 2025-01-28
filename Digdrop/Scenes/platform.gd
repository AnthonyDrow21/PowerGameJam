extends AnimatableBody2D

var whileTimerStatus = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_parent().find_child("TileMap")._test_remote_place()
	pass

