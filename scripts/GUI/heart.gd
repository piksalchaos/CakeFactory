extends TextureRect

@onready var explosion = $Explosion

func explode():
	explosion.visible = true
	explosion.play()

func _on_explosion_finished():
	queue_free()
