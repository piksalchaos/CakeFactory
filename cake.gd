extends Area2D
class_name Cake

@export var speed: float = 100.0
var is_moving: bool = true

func _process(delta: float):
	if is_moving:
		position.x -= speed * delta

func _on_area_exited(_area):
	stop_moving_if_fallen()

func stop_moving_if_fallen():
	is_moving = false
	for area in get_overlapping_areas():
		if area is ConveyorBelt:
			is_moving = true
