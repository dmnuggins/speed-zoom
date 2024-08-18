extends Node2D

@onready var area_2d = $Area2D
@onready var player = $Player


@export var zoom_speed: float = 2

const DEFAULT_CAM_POS := Vector2(576, 324)

var zoomed: bool = false # flag to track if game is zoomed or not

#Target zoom level
var target_zoom: Vector2 = Vector2.ONE

func _process(delta: float) -> void:
	#if camera.zoom != target_zoom:
		#camera.zoom = lerp(camera.zoom, target_zoom, zoom_speed * delta)
	pass
