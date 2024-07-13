extends Node2D

var puck_class = preload("res://assets/Puck/puck.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	var puck = puck_class.instantiate()
	puck.global_position = Vector2(280, 280)
	add_child(puck)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
