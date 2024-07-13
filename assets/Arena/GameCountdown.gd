extends Node2D

@export
var countdown_time = 5

@onready
var label = $Label

var txt = "Game Begins In: "

func _ready():
	label.text = txt + str(countdown_time)

func _on_timer_timeout():
	countdown_time -= 1
	
	if countdown_time == 0:
		queue_free()
	
	label.text = txt + str(countdown_time)
