extends Node2D

@export var heart_distance = 70
var heart_scene := preload('res://scenes/GUI/heart.tscn')

func clear_hearts():
	for heart in get_children():
		heart.queue_free()

func create_hearts(number_of_hearts: int):
	for i in range(number_of_hearts):
		var new_heart = heart_scene.instantiate()
		add_child(new_heart)
		new_heart.position.x = i * heart_distance

func explode_heart():
	if get_child_count() > 0:
		get_child(-1).explode()
