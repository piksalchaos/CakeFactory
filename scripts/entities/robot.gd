extends Node2D

enum Placement {
	TOP = -1,
	MIDDLE,
	BOTTOM
}

@export var up_input_action: String = 'middle_up'
@export var down_input_action: String = 'middle_down'
@export var placement: Placement = Placement.MIDDLE

@onready var cake_detection_area := $CakeDetectionArea

var screen_size: Vector2

func _ready():
	screen_size = get_viewport_rect().size
	_update_position()

func _unhandled_key_input(event):
	if event.is_action_pressed(up_input_action) and placement != Placement.TOP:
		placement -= 1
	elif event.is_action_pressed(down_input_action) and placement != Placement.BOTTOM:
		placement += 1
	_update_position()

func _update_position():
	var old_y_position = position.y
	position.y = placement * GameConstants.TILE_WIDTH + screen_size.y/2
	var y_position_difference = position.y - old_y_position
	for area in cake_detection_area.get_overlapping_areas():
		if area is Cake:
			area.position.y += y_position_difference
