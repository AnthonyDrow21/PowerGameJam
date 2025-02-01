extends CharacterBody2D

signal playerDied;

const SPEED = 130.0
@export var JUMP_VELOCITY = -300.0

@export var MAX_JUMPS = 1;
var JUMP_COUNT = MAX_JUMPS;
var isDead = false;

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
const deployedBox = preload("res://Scenes/Tools/DeployedBox.tscn");
@onready var game = get_tree().get_root();

#Used for animation handling in handleMovement function.
@onready var animated_sprite = $AnimatedSprite2D

func _ready() -> void:
	for item in PlayerStats.Items:
		if(item.name == "JetPack"):
			print("Setting max jumps.");
			MAX_JUMPS = 2;

func _physics_process(delta):
	handleMovement(delta);
	
	# Check that we have the box tool before we let the player spawn a box.
	var boxTool = self.get_node_or_null("DeployableBox");
	if(Input.is_action_just_pressed("UseItem") and boxTool != null):
		# Use the current active item.
		var newBox = deployedBox.instantiate();
		if animated_sprite.flip_h == false:
			newBox.global_position = self.position + Vector2(20,0);
		else:
			newBox.global_position = self.position + Vector2(-20,0)
		game.add_child(newBox);
	
	# Game over if the drill runs out of energy.
	if(PlayerStats.DrillEnergy == 0.0):
		PlayerDied();
	
	move_and_slide()

func handleMovement(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		
	# Handle jump.
	if Input.is_action_just_pressed("ui_up") and JUMP_COUNT > 0:
		velocity.y = JUMP_VELOCITY
		JUMP_COUNT = JUMP_COUNT - 1;
	
	# Reset the jumps when touching the ground. If the y velocity is equal to our jump velocity 
	# then we just jumped and do not want to reset our jumps right away.
	if is_on_floor() == true and velocity.y != JUMP_VELOCITY:
		JUMP_COUNT = MAX_JUMPS;
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	
	#animation handling
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
	
	#Play Animation
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("Idle")
		else:
			animated_sprite.play("Run")
	else:
		animated_sprite.play("Jump")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

func getIsDead():
	return isDead;

func PlayerDied():
	# Play the death animation of the player.
	isDead = true;
	$DeathTimer.start()
	pass;

func setMaxJumps(maxJumps: int):
	MAX_JUMPS = maxJumps;
	pass;

func _on_death_timer_timeout() -> void:
	playerDied.emit()
	get_tree().reload_current_scene()

