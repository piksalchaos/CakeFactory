extends Node

@export var health_points: int = 3

@onready var heart_display = $CanvasLayer/HUD/HeartDisplay

func _ready():
	heart_display.create_hearts(3)

func _on_cakes_child_entered_tree(cake):
	cake.oofed.connect(_on_cake_oofed)

func _on_cake_oofed():
	lose_health_point()

func lose_health_point():
	health_points -= 1
	heart_display.explode_heart()
