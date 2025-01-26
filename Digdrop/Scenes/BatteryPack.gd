extends Area2D

func _on_body_entered(body: Node2D) -> void:
	# Don't allow the player to gain more energy than their max energy.
	print("Energy Restored");
	PlayerStats.DrillEnergy = min(PlayerStats.DrillEnergy + 5.0, PlayerStats.MaxEnergy);
	queue_free()
