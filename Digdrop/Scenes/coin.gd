extends Area2D

func _on_body_entered(body):
	print("Coin Gained")
	PlayerStats.CoinCount = PlayerStats.CoinCount + 1;
	queue_free()
