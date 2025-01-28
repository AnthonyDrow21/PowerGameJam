extends Area2D

func _on_body_entered(body: Node2D) -> void:
	# Add the JetPack to the players item list.
	print("JetPack Picked up.");
	var player = get_tree().get_nodes_in_group("Player")[0];
	player.setMaxJumps(2);
	queue_free();
