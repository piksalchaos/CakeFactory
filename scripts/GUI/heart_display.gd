extends Control

var heart_scene := preload('res://scenes/GUI/heart.tscn')

func clear_hearts():
	for heart in get_children():
		heart.queue_free()

func create_hearts(number_of_hearts: int):
	for i in range(number_of_hearts):
		var new_heart = heart_scene.instantiate()
		add_child(new_heart)

func explode_heart():
	get_child(-1).explode()
