class_name Cake extends Area2D

@export var speed: float = 100.0

@onready var cake_sprite = $CakeSprite

var is_moving: bool = true
var goal_cake_build: CakeBuild

func _ready():
	goal_cake_build = CakeBuild.get_random_build()
	print(goal_cake_build.flavor, goal_cake_build.icing, goal_cake_build.toppings)

func _process(delta: float):
	if is_moving:
		position.x -= speed * delta

func _on_area_entered(area):
	if area is Machine:
		add_cake_elements(area.cake_build_elements)

func _on_area_exited(_area):
	stop_moving_if_fallen()

func stop_moving_if_fallen():
	is_moving = false
	for area in get_overlapping_areas():
		if area is ConveyorBelt:
			is_moving = true

func add_cake_elements(cake_elements: CakeBuild):
	cake_sprite.add_cake_elements(cake_elements)


