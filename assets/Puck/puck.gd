extends CharacterBody2D

var puck_speed: int = 400
var behavior: Callable = paused

var countdown_amount = 3
var label: Label = Label.new()
var pause_timer: Timer = Timer.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	var x_dir = -1 if randi_range(0, 1) == 0 else 1
	var angle = randi_range(-75, 75)
	var direction = Vector2(x_dir, 0).rotated(deg_to_rad(angle)).normalized()
	velocity = direction * puck_speed
	
	add_child(label)
	label.position.x += 10
	label.text = str(countdown_amount)
	add_child(pause_timer)
	pause_timer.timeout.connect(set_active)
	pause_timer.one_shot = false
	pause_timer.wait_time = 1
	pause_timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	behavior.call(delta)

func set_active():
	countdown_amount -= 1
	label.text = str(countdown_amount)
	
	if countdown_amount == 0:
		behavior = active
		pause_timer.queue_free()
		label.queue_free()

func paused(_delta):
	pass # do nothing when paused
	
func active(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
