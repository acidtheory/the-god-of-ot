extends Estado

func enter():
	jugador.sprite.play("Uy kieto")

func physics_update(_delta):
	if not jugador.is_on_floor():
		get_parent().ir_a_estado_siguiente("Cayendo")
	if Input.is_action_just_pressed("mover_derecha") or Input.is_action_just_pressed("mover_izquierda"):
		get_parent().ir_a_estado_siguiente("Corriendo")
	if Input.is_action_just_pressed("salto"):
		get_parent().ir_a_estado_siguiente("Saltando")
