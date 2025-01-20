extends CharacterBody2D

@export var move_speed : float = 100

@onready var animation_tree = $AnimationTree
@onready var state_machine = animation_tree.get("parameters/playback")

func _ready():
	update_animation_parameters(Vector2(0, 1))

func _physics_process(_delta):
	# Movement
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * move_speed
	
	update_animation_parameters(input_direction)
	
	move_and_slide()
	pick_new_state()
	
func update_animation_parameters(move_input: Vector2):
	
	if(move_input != Vector2.ZERO):
		animation_tree["parameters/Walk/blend_position"] = move_input 
		animation_tree["parameters/Idle/blend_position"] = move_input
		

func pick_new_state():
	if(velocity != Vector2.ZERO):
		state_machine.travel("Walk",false)
	else:
		state_machine.travel("Idle",false)

var idle_direction: String = "Idle" # Same names as animation
