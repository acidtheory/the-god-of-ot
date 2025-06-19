extends CharacterBody2D

@export var impulso_salto : float = 800
@export var speed = 12000
@export var gravedad : float = 2200
@export var sprite : AnimatedSprite2D

@export var hud : Control

var vida : int
var max_vida : int = 500
var energia : int
var max_energia : int = 15
var monedas : int
var doble_salto_adquirido : bool = true

func _ready():
	Globales.jugador = self
	inicializar_jugador()
	actualizar_hud()

func _physics_process(_delta):
	pass

func inicializar_jugador():
	vida = max_vida
	energia = max_energia
	monedas = 0

func morir():
	queue_free()

func herir(cantidad : int):
	vida -= cantidad
	if vida <= 0:
		morir()

func actualizar_hud():
	hud.vida = vida
	hud.max_vida = max_vida
	hud.energia = energia
	hud.max_energia = max_energia
	hud.monedas = monedas
	hud.actualizar_valores()
