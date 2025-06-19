extends Node

var datos_guardado : Dictionary = {
	"vida" : 100,
	"monedas" : 0,
	"checkpoint" : null,
	"mana" : 100,
	"doble_salto_adquirido" : false
}

func _ready():
	Globales.save_manager = self
	guardar()

func guardar():
	datos_guardado.monedas = Globales.jugador.monedas
	datos_guardado.vida = Globales.jugador.vida
	datos_guardado.mana = Globales.jugador.mana
	
	
	var archivo_guardado = FileAccess.open("user://archivo_guardado.save",FileAccess.WRITE)
	archivo_guardado.store_line(JSON.stringify(datos_guardado))

func cargar():
	var archivo_guardado = FileAccess.open("user://archivo_guardado.save",FileAccess.READ)
	var texto = archivo_guardado.get_line()
	var json = JSON.new()
	json.parse(texto)
	datos_guardado = json.data
	
	Globales.jugador.monedas = datos_guardado.monedas
