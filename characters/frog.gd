extends CharacterBody2D


@export var SPEED = 500.0
const JUMP_VELOCITY = -400.0

var isFlipped = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):

	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
		if(direction > 0):
			isFlipped = true
			get_node("Sprite2D").set_flip_h(isFlipped)
			$AnimationPlayer.play("left_walk")
		elif(direction < 0):
			isFlipped = false
			get_node("Sprite2D").set_flip_h(isFlipped)
			$AnimationPlayer.play("left_walk")
		
	else:
		get_node("Sprite2D").set_flip_h(isFlipped)
		$AnimationPlayer.play("left_idle")
		velocity.x = move_toward(velocity.x, 0, SPEED)
		

	move_and_slide()
