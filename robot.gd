extends Node2D

const PLACEMENT_DISTANCE: float = 150.0

enum Placement {
	TOP = -1,
	MIDDLE,
	BOTTOM
}

@export var up_input_action: String = 'middle_up'
@export var down_input_action: String = 'middle_down'
@export var placement: int = Placement.MIDDLE

@onready var conveyor_belt = $ConveyorBelt

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
	position.y = placement * PLACEMENT_DISTANCE + screen_size.y/2
	var y_position_difference = position.y - old_y_position
	for area in conveyor_belt.get_overlapping_areas():
		if area is Cake:
			area.position.y += y_position_difference
