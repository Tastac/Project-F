extends Node2D

var Room = preload("res://scenes/room.tscn")

var tile_size = 32
var num_rooms = 50
var min_size = 4
var max_size = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	#print(room)
	randomize()
	make_rooms()
	#pass # Replace with function body.

func regen():
	randomize()
	make_rooms()

func make_rooms():
	for i in range(num_rooms):
		var pos = Vector2(0, 0)
		var r = Room.instantiate()
		var w = min_size + randi() % (max_size - min_size)
		var h = min_size + randi() % (max_size - min_size)
		r.make_room(pos, Vector2(w, h) * tile_size)
		$Rooms.add_child(r)
		
func _draw():
	for room in $Rooms.get_children():
		draw_rect(Rect2(room.position - room.size, room.size * 2),
			Color(32, 228, 0), false)
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Input.is_action_just_released("space")):
		regen()
		
	queue_redraw()
