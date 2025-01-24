extends Node2D

var Room = preload("res://scenes/room.tscn")

@export var tile_size = 32
var num_rooms = 5
var hspread = 200
@export var min_size = 4
@export var max_size = 10

@export var num_rooms_min = 49
@export var num_rooms_max = 50

#var rooms : Array[RigidBody2D] = []

var random_room = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	#print(room)
	
	random_room.randomize()
	num_rooms = random_room.randi_range(num_rooms_min, num_rooms_max)
	print(num_rooms)
	regen()
	#pass # Replace with function body.

func regen():
	#random_room.seed = 1
	make_rooms()
	#minimizing_rooms()

func make_rooms():
	for i in range(num_rooms):
		var pos = Vector2(0, 0)
		var r = Room.instantiate()
		var w = min_size + random_room.randi() % (max_size - min_size)
		var h = min_size + random_room.randi() % (max_size - min_size)
		r.make_room(pos, Vector2(w, h) * tile_size)
		#rooms[i] = r
		$Rooms.add_child(r)
	
func minimizing_rooms():
#	rooms[1]
	pass
		
#func _draw():
#	for room in $Rooms.get_children():
#		draw_rect(Rect2(room.position - room.size, room.size * 2),
#			Color(32, 228, 0), false)
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	queue_redraw()
	pass

func _input(event):
	if(Input.is_action_just_released("space")):
		print(num_rooms)
		for n in $Rooms.get_children():
			n.queue_free()
		random_room.randomize()
		regen()
