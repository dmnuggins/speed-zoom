extends Node2D

@onready var area_2d = $Area2D
@onready var camera_2d = $Camera2D

@export var zoom_speed: float = 2

const DEFAULT_CAM_POS := Vector2(576, 324)

var zoomed: bool = false # flag to track if game is zoomed or not

#Target zoom level
var target_zoom: Vector2 = Vector2.ONE

func _process(delta: float) -> void:
	if camera_2d.zoom != target_zoom:
		camera_2d.zoom = lerp(camera_2d.zoom, target_zoom, zoom_speed * delta)



func _on_area_2d_body_entered(body: Node) -> void:
	if body is CharacterBody2D:
		target_zoom = camera_2d.zoom * 3
	pass # Replace with function body.


func _on_area_2d_body_exited(body: Node) -> void:
	if body is CharacterBody2D:
		target_zoom = Vector2.ONE
		camera_2d.position 
	pass # Replace with function body.
