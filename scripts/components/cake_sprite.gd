extends Sprite2D

@onready var ingredients_sprite = $IngredientsSprite
@onready var flavor_sprite = $FlavorSprite
@onready var icing_sprite = $IcingSprite
@onready var toppings_sprite = $ToppingsSprite
@onready var fallen_sprite = $FallenSprite

func _ready():
	ingredients_sprite.visible = true
	flavor_sprite.visible = false
	icing_sprite.visible = false
	toppings_sprite.visible = false
	fallen_sprite.visible = false

func add_cake_elements(cake_elements: CakeBuild):
	if cake_elements.flavor != CakeElements.Flavor.NONE:
		ingredients_sprite.visible = false
		flavor_sprite.visible = true
		flavor_sprite.frame = cake_elements.flavor-1
	if cake_elements.icing != CakeElements.Icing.NONE:
		flavor_sprite.visible = false
		icing_sprite.visible = true
		icing_sprite.frame = cake_elements.icing-1
	if cake_elements.toppings != CakeElements.Toppings.NONE:
		toppings_sprite.visible = true
		toppings_sprite.frame = cake_elements.toppings-1

func show_fallen_sprite():
	ingredients_sprite.visible = false
	flavor_sprite.visible = false
	icing_sprite.visible = false
	toppings_sprite.visible = false
	fallen_sprite.visible = true

#func change_flavor_sprite(flavor: CakeBuild.Flavor):
	#match flavor:
		#CakeBuild.Flavor.VANILLA:
			#flavor_sprite.frame = 0
		#CakeBuild.Flavor.CHOCOLATE:
			#flavor_sprite.frame = 1
		#CakeBuild.Flavor.ICE_CREAM:
			#flavor_sprite.frame = 2
