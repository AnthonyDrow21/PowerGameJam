extends Area2D


func _on_body_entered(body):
	
	var player = get_tree().get_nodes_in_group("Player")[0];
	
	# Only kill the player if they are not dead. We don't want to call the function multiple times.
	if(player.getIsDead() == false):
		print("You died!")
		player.PlayerDied();
	pass # Replace with function body.
