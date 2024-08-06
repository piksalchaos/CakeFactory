@tool
extends Sprite2D

enum ElementType {
	FLAVOR,
	ICING,
	TOPPINGS
}

@export var ingredient_type: ElementType = ElementType.FLAVOR:
	set(new_ingredient_type):
		ingredient_type = new_ingredient_type
		frame_coords.y = new_ingredient_type

@export_range(0,2) var element: int = 0:
	set(new_element):
		element = new_element
		frame_coords.x = new_element

# THIS CODE SUCKS ASS, REMEMBER TO CHANGE IT TO INCLUDE CAKEELEMENTS CLASS OR SOMETHING
