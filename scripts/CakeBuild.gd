class_name CakeBuild extends Resource

#class Flavor extends CakeElement:
#	static var VANILLA := 1

enum Flavor {
	NONE,
	VANILLA,
	CHOCOLATE,
	ICE_CREAM
}
enum Icing {
	NONE,
	VANILLA,
	CHOCOLATE,
	STRAWBERRY
}
enum Toppings {
	NONE,
	FRUIT,
	CANDY,
	SPRINKLES
}

@export var flavor: Flavor = Flavor.NONE
@export var icing: Icing = Icing.NONE
@export var toppings: Toppings = Toppings.NONE
