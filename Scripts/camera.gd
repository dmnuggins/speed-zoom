extends Camera2D

@export var zoom_speed := 2
@export var move_speed := 5.0

var target_zoom := Vector2.ONE
var target_position := Vector2.ZERO
var zooming_in := false

func _process(delta):
	if zooming_in:
		
		if zoom != target_zoom:
			zoom = lerp(zoom, target_zoom, zoom_speed * delta)
			
		position = lerp(position, target_position, move_speed * delta)
		
func zoom_and_lock_on(player: CharacterBody2D) -> void:
	target_zoom = Vector2(2, 2)
	target_position = player.global_position
	zooming_in = true
