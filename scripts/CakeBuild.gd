class_name CakeBuild extends Resource

@export var flavor: CakeElements.Flavor = CakeElements.Flavor.NONE
@export var icing: CakeElements.Icing = CakeElements.Icing.NONE
@export var toppings: CakeElements.Toppings = CakeElements.Toppings.NONE

static func get_random_build():
	var random_element_value = func(): return randi_range(1, 3)
	var cakeBuild = CakeBuild.new()
	cakeBuild.flavor = random_element_value.call()
	cakeBuild.icing = random_element_value.call()
	cakeBuild.toppings = random_element_value.call()
	return cakeBuild
