class_name Cake extends Area2D

@export var speed: float = 100.0

@onready var cake_sprite := $CakeSprite
@onready var elements_label := $ElementsLabel

var is_moving: bool = true
var goal_cake_build: CakeBuild

const elements_label_string_format = "Flavor: %s\nIcing: %s\nToppings: %s"

func _ready():
	goal_cake_build = CakeBuild.get_random_build()
	elements_label.text = elements_label_string_format % [
		CakeElements.flavor_to_string(goal_cake_build.flavor),
		CakeElements.icing_to_string(goal_cake_build.icing),
		CakeElements.toppings_to_string(goal_cake_build.toppings)
	]

func _process(delta: float):
	if is_moving:
		position.x -= speed * delta

func _on_area_entered(area):
	if area is Machine:
		cake_sprite.add_cake_elements(area.cake_build_elements)

func _on_area_exited(_area):
	stop_moving_if_fallen()

func stop_moving_if_fallen():
	is_moving = false
	for area in get_overlapping_areas():
		if area is ConveyorBelt:
			is_moving = true
