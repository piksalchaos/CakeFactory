class_name Cake extends Area2D

@export var speed: float = 100.0
@export var goal_cake_build: CakeBuild

@onready var ingredients_sprite = $IngredientsSprite
@onready var flavor_sprite = $FlavorSprite
@onready var icing_sprite = $IcingSprite
@onready var toppings_sprite = $ToppingsSprite

var is_moving: bool = true

func _ready():
	ingredients_sprite.visible = true
	flavor_sprite.visible = false
	icing_sprite.visible = false
	toppings_sprite.visible = false

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
		ingredients_sprite.visible = false
		flavor_sprite.visible = true
		flavor_sprite.frame = cake_elements.flavor-1
	if cake_elements.icing != CakeBuild.Icing.NONE:
		flavor_sprite.visible = false
		icing_sprite.visible = true
		icing_sprite.frame = cake_elements.icing-1
	if cake_elements.toppings != CakeBuild.Toppings.NONE:
		toppings_sprite.visible = true
		toppings_sprite.frame = cake_elements.toppings-1

#func change_flavor_sprite(flavor: CakeBuild.Flavor):
	#match flavor:
		#CakeBuild.Flavor.VANILLA:
			#flavor_sprite.frame = 0
		#CakeBuild.Flavor.CHOCOLATE:
			#flavor_sprite.frame = 1
		#CakeBuild.Flavor.ICE_CREAM:
			#flavor_sprite.frame = 2
