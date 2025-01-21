extends CharacterBody2D

@export var move_speed : float = 200
@export var starting_direction : Vector2 = Vector2(0, 1)
const JUMP_VELOCITY = -400.0

@onready var animation_tree = $AnimationTree
@onready var state_machine = animation_tree.get("parameters/playback")

func _ready():
	update_animation_parameters(starting_direction)

func _physics_process(delta: float) -> void:
	
		# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	
	var input_direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)
	
	update_animation_parameters(input_direction)
	
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * move_speed
	else:
		velocity.x = move_toward(velocity.x, 0, move_speed)
	
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
