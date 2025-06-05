extends Control

var vida = 100
var max_vida = 300
var energia = 20
var max_energia = 100
var monedas = 120

@onready var barra_vida = $MarginContainer/BarraContainer/BarraVida/ProgressBar
@onready var texto_vida = $MarginContainer/BarraContainer/BarraVida/NumeroVida

@onready var barra_energia = $MarginContainer/BarraContainer/BarraEnergia/ProgressBar
@onready var texto_energia = $MarginContainer/BarraContainer/BarraEnergia/NumeroEnergia

@onready var texto_monedas = $MarginContainer/MonedasContainer/Label

func _ready():
	actualizar_valores()

func _process(delta):
	barra_vida.value = vida
	texto_vida.text = str(vida)
	barra_energia.value = energia
	texto_energia.text = str(energia)

func actualizar_valores():
	barra_vida.max_value = max_vida
	barra_energia.max_value = max_energia
