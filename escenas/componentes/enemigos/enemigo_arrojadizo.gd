extends CharacterBody2D

# Detectar si el jugador esta cerca
# Si el jugador esta cerca, disparar un proyectil despues
# de cierta cantidad de tiempo

@export var vida : int
@export_group("Ataque")
@export var escena_bala : PackedScene
@export var damage : int
@export var frecuencia_ataque : float
@export var distancia_vision : float
@export_group("Movimiento")
@export var gravedad : float
@export var velocidad : float
@export var distancia_movimiento : float


@onready var posicion_inicial = global_position
var direccion = 1
var cambiando_direccion = false
func _physics_process(delta):
	
	# movimiento basico
	velocity.y = gravedad
	velocity.x = velocidad * direccion
	var distancia = abs(global_position.x - posicion_inicial.x)
	if distancia >= distancia_movimiento and not cambiando_direccion:
		direccion = -direccion
		cambiando_direccion = true
		await get_tree().create_timer(0.5).timeout
		cambiando_direccion = false
		
	print(global_position.distance_to(Globales.jugador.global_position))
		
		
	move_and_slide()
	

func timer_bala():
	if global_position.distance_to(Globales.jugador.global_position) < distancia_vision:
		var bala = escena_bala.instantiate()
		add_child(bala)
		bala.global_position = global_position
		bala.direccion = global_position.direction_to(Globales.jugador.global_position)
