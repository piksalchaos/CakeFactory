class_name CakeElements extends Node

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

static func _index_to_string(index: int, string_list: Array[String]) -> String:
	return string_list[index]

static func flavor_to_string(flavor: Flavor) -> String:
	return _index_to_string(flavor, ['None', 'Vanilla', 'Chocolate', 'Ice Cream'])

static func icing_to_string(icing: Icing) -> String:
	return _index_to_string(icing, ['None', 'Vanilla', 'Chocolate', 'Strawberry'])

static func toppings_to_string(toppings: Toppings) -> String:
	return _index_to_string(toppings, ['None', 'Fruit', 'Candy', 'Sprinkles'])
