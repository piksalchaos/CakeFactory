class_name Cake extends Area2D

@export var speed: float = 100.0
@export var goal_cake_build: CakeBuild

@onready var ingredients_sprite = $IngredientsSprite
@onready var cake_sprite = $CakeSprite
@onready var icing_sprite = $IcingSprite
@onready var topping_sprite = $ToppingSprite

var is_moving: bool = true

func _ready():
	ingredients_sprite.visible = true
	cake_sprite.visible = false
	icing_sprite.visible = false
	topping_sprite.visible = false

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
	if cake_elements.flavor != CakeBuild.Flavor.NONE:
		cake_sprite.visible = true
	if cake_elements.icing != CakeBuild.Icing.NONE:
		icing_sprite.visible = true
	if cake_elements.toppings != CakeBuild.Toppings.NONE:
		topping_sprite.visible = true
