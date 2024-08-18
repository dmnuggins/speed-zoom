extends Camera2D

@export var zoom_speed := 2
@export var move_speed := 5.0

var target_zoom := Vector2.ONE
var target_position := Vector2.ZERO
var zooming_in := false
var zoom_enabled := false

signal zoom_toggled

func _ready():
	connect("zoom_toggled", on_zoom_toggled)

func _process(delta):
	if zoom_enabled:
		zoom_in()
		if zoom != target_zoom:
			zoom = lerp(zoom, target_zoom, zoom_speed * delta)
	else:
		reset_zoom()
		if zoom != target_zoom:
			zoom = lerp(zoom, target_zoom, zoom_speed * delta)

func zoom_in() -> void:
	target_zoom = Vector2(2, 2)

func reset_zoom():
	target_zoom = Vector2.ONE

func on_zoom_toggled():
	zoom_enabled = !zoom_enabled
	print("zoom_enabled: " + str(zoom_enabled))
