class_name Cake extends Area2D

@export var speed: float = 50.0
@export_range(-1,1) var row: int = 0:
	set(row_value):
			row = row_value
			position.y = row_value * GameConstants.TILE_WIDTH

var is_moving: bool = true
var goal_cake_build: CakeBuild

@onready var cake_sprite := $CakeSprite
@onready var elements_label := $ElementsLabel

@onready var flavor_icon := $IngredientIcons/FlavorIcon
@onready var icing_icon := $IngredientIcons/IcingIcon
@onready var toppings_icon := $IngredientIcons/ToppingsIcon
@onready var ingredient_icons := $IngredientIcons

func _ready():
	goal_cake_build = CakeBuild.get_random_build()
	flavor_icon.element = goal_cake_build.flavor-1
	icing_icon.element = goal_cake_build.icing-1
	toppings_icon.element = goal_cake_build.toppings-1

func _process(delta: float):
	if is_moving:
		position.x -= speed * delta

func _on_area_entered(area):
	if area is Machine:
		cake_sprite.add_cake_elements(area.cake_build_elements)

func _on_area_exited(_area):
	if not is_on_conveyor() and is_moving:
		cake_sprite.show_fallen_sprite()
		ingredient_icons.visible = false
		is_moving = false

func is_on_conveyor() -> bool:
	for area in get_overlapping_areas():
		if area is ConveyorBelt:
			return true
	return false
