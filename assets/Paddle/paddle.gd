extends CharacterBody2D

# finite values for who can control a paddle
enum ControlType { PLAYER1, PLAYER2, CPU }

# define how paddle is controlled based on who is controlling
@export
var player_control: ControlType = ControlType.CPU
var move_function: Callable = cpu_move

# default paddle speed
var paddle_speed = 500

func _ready():
	if player_control == ControlType.PLAYER1:
		move_function = p1_move
	elif player_control == ControlType.PLAYER2:
		move_function = p2_move
	# we'll just fall back on CPU player if theres an invalid input somehow

func _physics_process(delta):
	move_function.call(delta)

func cpu_move(_delta):
	pass
	
func p1_move(_delta):
	velocity = Vector2()
	if Input.is_action_pressed("p1_up"):
		velocity.y -= paddle_speed
	if Input.is_action_pressed("p1_down"):
		velocity.y += paddle_speed
		
	move_and_slide()
	
func p2_move(_delta):
	velocity = Vector2()
	if Input.is_action_pressed("p2_up"):
		velocity.y -= paddle_speed
	if Input.is_action_pressed("p2_down"):
		velocity.y += paddle_speed
		
	move_and_slide()
