extends Estado

func enter():
	jugador.sprite.play("Jump")
func physics_update(_delta):
	if Input.is_action_pressed("salto"):
		jugador.velocity.y = -jugador.gravedad
		jugador.move_and_slide()
