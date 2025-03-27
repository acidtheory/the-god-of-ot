extends Estado

func enter():
	jugador.sprite.play("Why are u runnin")

func update(_delta):
	if Input.is_action_pressed("mover_derecha"):
		jugador.velocity.x = jugador.speed
		jugador.move_and_slide()
		jugador.sprite.flip_h = false
	elif Input.is_action_pressed("mover_izquierda"):
		jugador.velocity.x = -jugador.speed
		jugador.move_and_slide()
		jugador.sprite.flip_h = true
	else:
		get_parent().ir_a_estado_siguiente("Quieto")
