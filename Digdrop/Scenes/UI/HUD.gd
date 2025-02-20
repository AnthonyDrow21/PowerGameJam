class_name HUD
extends CanvasLayer

func _ready() -> void:
	#Initialize the stats for the timer.
	$VBoxContainer/DrillEnergy.max_value = PlayerStats.MaxEnergy;
	$VBoxContainer/DrillEnergy.value = PlayerStats.DrillEnergy;
	pass

func _process(delta: float) -> void:
	# Update the energy progress bar value every frame.
	$VBoxContainer/DrillEnergy.value = PlayerStats.DrillEnergy;
	$VBoxContainer/HBoxContainer/CoinTotal.text = "%d" % [PlayerStats.CoinCount];
	pass


# On timout, reduce the energy of the drill. 
func _on_energy_timer_timeout() -> void:
	PlayerStats.DrillEnergy = PlayerStats.DrillEnergy - 1.0;
	#print("Energy Reduced! Current Energy: ", PlayerStats.DrillEnergy);
	pass
