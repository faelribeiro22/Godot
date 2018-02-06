extends Node2D

onready var felpudo = get_node("Felpudo")
onready var timeReplay = get_node("timeToReplay")
onready var label = get_node("Node2D/Control/Label")

var pontos = 0
var estado = 1

const JOGANDO = 1
const PERDENDO = 2

func _ready():
	pass

func kill():
	felpudo.apply_impulse(Vector2(0, 0), Vector2(-1000, 0))
	get_node("BackAnim").stop()
	estado = PERDENDO
	timeReplay.start()

func pontuar():
	pontos += 1
	label.set_text(str(pontos))

func _on_timeToReplay_timeout():
	get_tree().reload_current_scene()
