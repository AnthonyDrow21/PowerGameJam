extends TileMap

var ZERO:int = 0

@onready var drill = $"../Drill"

func _ready():
	#var dirtAhead = get_tree().get_root().find_child("Drill")
	#dirtAhead.connect("dirtahead", self, "handledirtahead")
	pass

func _process(delta):
	if (Input.is_action_just_pressed("use_equipped_item")):
		var tile : Vector2 = local_to_map(get_global_mouse_position())
		erase_cell(ZERO, tile)
	pass

func _test_remote_place():
	var drillBits = drill.get_node("DrillBits").get_children()
	for specificBit in drillBits:
		var tile : Vector2 = local_to_map(specificBit.global_position)
		erase_cell(ZERO, tile)
		
