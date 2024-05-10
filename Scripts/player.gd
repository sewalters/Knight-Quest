extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0
@onready var animated_sprite = $AnimatedSprite2D
@onready var jump_sfx = $jump_sfx

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var jump_counter = 1; # Jump counter, decrements when user jumps. resets to 2 when user lands.

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jumps.
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			jump_counter -=  1
			jump_sfx.play()
			velocity.y = JUMP_VELOCITY
		else:
			if jump_counter > 0:
				jump_counter -=  1
				jump_sfx.play()
				velocity.y = JUMP_VELOCITY
				
	if is_on_floor():
		jump_counter = 1
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	
	# Get input direction: -1, 0, 1
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
		
	# Play animations
	if animated_sprite.animation == "death":
		animated_sprite.play("death")
	elif is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		if jump_counter == 1:
			animated_sprite.play("jump")
		else:
			animated_sprite.play("jump2")
		
		
	
		
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

