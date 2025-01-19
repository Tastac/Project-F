extends RigidBody2D

@export var speed = 200

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	linear_velocity = input_direction * speed;
	
func _physics_process(delta: float) -> void:
	self.rotation = 0;
	get_input()
