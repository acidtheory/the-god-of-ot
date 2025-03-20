extends Node
class_name MaquinaEstado

@export var jugador : CharacterBody2D
var estado_actual : Estado

func _ready():
	estado_actual = get_child(0)
	estado_actual.enter()
	
func _process(delta):
	estado_actual.update(delta)

func ir_a_estado_siguiente(estado_siguiente : Estado):
	estado_actual.exit()
	estado_actual = estado_siguiente
	estado_actual.enter()
