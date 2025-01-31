extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	# Add the JetPack to the players item list.
	if(body.is_in_group("Player") == true):
		print("Deployable Box Picked up.");
		var player = get_tree().get_nodes_in_group("Player")[0];
		self.get_parent().remove_child(self);
		player.add_child(self);
		self.visible = false;
		# TODO Remove the AnimatedSprite and collision or place this object in the Items array.
