extends TextureRect

signal finished

@export var frame_width: int = 1
@export var frame_height: int = 1
@export var number_of_frames: int = 1
@export var beginning_frame: int = 0
@export var frame_time: float = 1.0
@export var is_loop: bool = false
@export var autostart: bool = false

var current_frame: int = beginning_frame
var frame_countdown: float = frame_time

func _ready():
	set_frame(beginning_frame)
	if not autostart:
		set_process(false)

func _process(delta):
	frame_countdown -= delta
	if frame_countdown <= 0:
		current_frame = (current_frame+1) % number_of_frames
		frame_countdown += frame_time
		set_frame(current_frame)
	if current_frame == number_of_frames-1:
		finished.emit()
		if not is_loop:
			stop()

func set_frame(frame: int):
	texture.set_region(Rect2(frame*frame_width, 0, frame_width, frame_height))

func play(start_frame: int = 0):
	frame_countdown = frame_time
	set_process(true)

func stop():
	set_process(false)
