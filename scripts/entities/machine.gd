class_name Machine extends Area2D

@export var cake_build_elements: CakeBuild

@onready var ingredient_icon := $IngredientIcon

func _ready():
	if cake_build_elements.flavor != CakeElements.Flavor.NONE: # EWW THIS CODE IS KINDA CRINGE LIKE YANDEREDEV KINDA CRINGE, REMEMBER TO FIX LATER
		ingredient_icon.ingredient_type = 0
		ingredient_icon.element = cake_build_elements.flavor-1
	elif cake_build_elements.icing != CakeElements.Icing.NONE:
		ingredient_icon.ingredient_type = 1
		ingredient_icon.element = cake_build_elements.icing-1
	elif cake_build_elements.toppings != CakeElements.Toppings.NONE:
		ingredient_icon.ingredient_type = 2
		ingredient_icon.element = cake_build_elements.toppings-1
