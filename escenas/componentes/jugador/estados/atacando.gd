extends Estado

@export var attack_hitbox : Area2D

func enter():
	jugador.sprite.play("Atak")

func physics_update(_delta):
	for hit in attack_hitbox.get_overlapping_bodies():
		if hit.is_in_group("Enemigos"):
			hit.queue_free()
	
	await jugador.sprite.animation_finished
	get_parent().ir_a_estado_siguiente("Quieto")
	
func exit():
	jugador.sprite.stop()
