extends Node2D

@export var cake_parent_node: Node

var cake_scene := preload('res://scenes/entities/cake.tscn')

@onready var cake_spawn_timer := $CakeSpawnTimer

func _on_cake_spawn_timer_timeout():
	var new_cake = cake_scene.instantiate()
	cake_parent_node.add_child(new_cake)
	new_cake.position = position
