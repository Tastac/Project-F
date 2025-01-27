extends Node



@export var number_rooms: int = 10

var random_rooms = RandomNumberGenerator.new()

@export var grid_size: int = 275
@export var dungeon = {}

#var LoadedRoom: Array[] = 

@export_category("Rooms")
@export var StartingRooms: Array[PackedScene] = [
	preload("res://scenes/rooms/Start01.tscn")
]
@export var Rooms: Array[PackedScene] = [
	preload("res://scenes/rooms/Room01.tscn")
]
@export var EndingRooms: Array[PackedScene] = [
	preload("res://scenes/rooms/End01.tscn")
]

var room_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	setupRooms()
	place_rooms()
	#pass # Replace with function body.

func setupRooms():
	var current_pos = Vector2(0, 0)
	dungeon[current_pos] = true
	
	for i in range(number_rooms - 1):
		var new_pos = get_random_adjacent_position(current_pos)
		while dungeon.has(new_pos):
			new_pos = get_random_adjacent_position(current_pos)
		dungeon[new_pos] = true
		current_pos = new_pos

func get_random_adjacent_position(position: Vector2) -> Vector2:
	var dir = [
		Vector2(0, -1),
		Vector2(0, 1),
		Vector2(-1, 0),
		Vector2(1, 0)
	]
	return position + dir[randi() % dir.size()]
	
func place_rooms():
	for position in dungeon.keys():
		var room_instance = StartingRooms[random_rooms.randi_range(0, StartingRooms.size() - 1)].instantiate()
		room_instance.position = position * grid_size
		add_child(room_instance)
		connect_doors(room_instance, position)

func connect_doors(room: Node2D, pos: Vector2):
	var dir = {
		"DoorTop": Vector2(0, -1),
		"DoorBottom": Vector2(0, 1),
		"DoorLeft": Vector2(-1, 0),
		"DoorRight": Vector2(1, 0)
	}
	
	for door_name in dir:
		var neighbor_position = pos + dir[door_name]
		if dungeon.has(neighbor_position):
			continue
		else:
			if room.has_node(door_name):
				room.get_node(door_name).queue_free()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
