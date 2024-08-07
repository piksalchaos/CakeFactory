extends Node2D

@export var up_input_action: String = 'middle_up'
@export var down_input_action: String = 'middle_down'
@export_range(-1, 1) var row: int:
	set = _update_row

var screen_size: Vector2

@onready var cake_detection_area := $CakeDetectionArea

func _ready():
	screen_size = get_viewport_rect().size
	row = 0

func _unhandled_key_input(event):
	if event.is_action_pressed(up_input_action) and row > -1:
		row -= 1
	elif event.is_action_pressed(down_input_action) and row < 1:
		row += 1

func _update_row(row_value):
	row = row_value
	position.y = row_value * GameConstants.TILE_WIDTH
	for area in cake_detection_area.get_overlapping_areas():
		if area is Cake: area.row = row
