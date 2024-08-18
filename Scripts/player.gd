extends CharacterBody2D

@export var rotation_speed := 5
@export var speed := 500
@export var decel := 1.0
@export var accel := 1.0

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func _process(delta: float) -> void:
	var rotate = Input.get_axis("left","right") * rotation_speed
	rotate(rotate * delta)

	
	if Input.is_action_pressed("up"):
		velocity = lerp(velocity, transform.y * -speed, accel * delta)
	
	move_and_slide()
	velocity = lerp(velocity, Vector2.ZERO, decel * delta)
