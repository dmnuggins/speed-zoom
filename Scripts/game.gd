extends Node2D

@onready var area_2d = $Area2D
@onready var camera = $Camera

@export var zoom_speed: float = 2

const DEFAULT_CAM_POS := Vector2(576, 324)

var zoomed: bool = false # flag to track if game is zoomed or not

#Target zoom level
var target_zoom: Vector2 = Vector2.ONE

func _process(delta: float) -> void:
	#if camera.zoom != target_zoom:
		#camera.zoom = lerp(camera.zoom, target_zoom, zoom_speed * delta)
	pass


func _on_area_2d_body_entered(body: Node) -> void:
	if body is CharacterBody2D:
		camera.zoom_and_lock_on(body)



func _on_area_2d_body_exited(body: Node) -> void:
	if body is CharacterBody2D:
		target_zoom = Vector2.ONE
		camera.position = DEFAULT_CAM_POS
