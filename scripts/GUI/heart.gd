extends Sprite2D

@onready var explosion_sprite := $ExplosionSprite
@onready var animation_player := $AnimationPlayer

func ready():
	explosion_sprite.visible = false

func explode():
	explosion_sprite.visible = true
	animation_player.play('explosion')

func _on_animation_player_animation_finished(anim_name):
	if anim_name == 'explosion':
		queue_free()
