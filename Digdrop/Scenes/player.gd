extends CharacterBody2D

signal playerDied;

const SPEED = 130.0
const JUMP_VELOCITY = -300.0

var isDead = false;

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func getIsDead():
	return isDead;

func PlayerDied():
	# Play the death animation of the player.
	isDead = true;
	$DeathTimer.start()
	pass;

func _on_death_timer_timeout() -> void:
	playerDied.emit()
	get_tree().reload_current_scene()

