class_name Cake extends Area2D

signal oofed

@export var speed: float = 50.0
@export_range(-1,1) var row: int = 0:
	set(row_value):
		row = row_value
		position.y = row_value * GameConstants.TILE_WIDTH

var is_moving: bool = true
var has_reached_end: bool = false
var goal_cake_build: CakeBuild

@onready var cake_sprite := $CakeSprite
@onready var animation_player := $AnimationPlayer

@onready var flavor_icon := $IngredientIcons/FlavorIcon
@onready var icing_icon := $IngredientIcons/IcingIcon
@onready var toppings_icon := $IngredientIcons/ToppingsIcon
@onready var ingredient_icons := $IngredientIcons

func _ready():
	goal_cake_build = CakeBuild.get_random_build()
	flavor_icon.element = goal_cake_build.flavor-1  # *barf emoji*
	icing_icon.element = goal_cake_build.icing-1
	toppings_icon.element = goal_cake_build.toppings-1

func _process(delta: float):
	if is_moving:
		position.x -= speed * delta

func _on_area_entered(area):
	if area is CakeCollector:
		has_reached_end = true
		queue_free()
		return
	
	if area is Machine:
		var build_elements = area.cake_build_elements
		var is_machine_incorrect = false
		if build_elements.flavor != CakeElements.Flavor.NONE:  #EEEWWWWWWWWWWWWW
			if goal_cake_build.flavor != build_elements.flavor:
				is_machine_incorrect = true
		if build_elements.icing != CakeElements.Icing.NONE:
			if goal_cake_build.icing != build_elements.icing:
				is_machine_incorrect = true
		if build_elements.toppings != CakeElements.Toppings.NONE:
			if goal_cake_build.toppings != build_elements.toppings:
				is_machine_incorrect = true
		cake_sprite.add_cake_elements(build_elements)
		if is_machine_incorrect:
			oofed.emit()

func _on_area_exited(_area):
	if not has_reached_end and is_moving and not is_on_conveyor():
		cake_sprite.show_fallen_sprite()
		animation_player.play("fade")
		ingredient_icons.visible = false
		is_moving = false
		oofed.emit()

func _on_animation_player_animation_finished(anim_name):
	if anim_name == 'fade':
		queue_free()

func is_on_conveyor() -> bool:
	for area in get_overlapping_areas():
		if area is ConveyorBelt:
			return true
	return false

func move_row_to(new_row: int):
	if is_moving: row = new_row
