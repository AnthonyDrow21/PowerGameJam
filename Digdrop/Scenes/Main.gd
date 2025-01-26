extends Node2D

var gameOverMenu = preload("res://Scenes/UI/GameOverMenu.tscn").instantiate()
@onready var player = get_node("Player");

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_player_player_died() -> void:
	PlayerStats.DrillEnergy = PlayerStats.MaxEnergy;
	pass # Replace with function body.
