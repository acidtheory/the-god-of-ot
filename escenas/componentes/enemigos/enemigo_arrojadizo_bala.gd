extends Area2D

var velocidad : float = 5
var direccion : Vector2 = Vector2(1,1)

func _ready():
	await get_tree().create_timer(1).timeout
	queue_free()

func _physics_process(delta):
	global_position += direccion * velocidad
