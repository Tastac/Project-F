extends Node

@export var numbers_rooms = 5

var random_rooms = RandomNumberGenerator.new()

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

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	setupRooms()
	#pass # Replace with function body.

func setupRooms():
	
	#$Rooms.add_child(StartingRooms[random_rooms.randi_range(0, len(StartingRooms))].instantiate())
	#var room0 = $Rooms.get_child(0)
	#Starting Room
	#$Rooms.add_child(StartingRooms[0].instantiate())
	#Rooms
	#for i in numbers_rooms:
	
	$Rooms.add_child(StartingRooms[random_rooms.randi_range(0, len(StartingRooms) - 1)].instantiate())
	$Rooms.add_child(Rooms[0].instantiate())
	
	$Rooms.get_child(1).get_child(0)
	
	if($Rooms.get_child(0).doors[1] and $Rooms.get_child(1).doors[0]):
		#random_rooms.randi_range(0, len(Rooms) - 1)].instantiate())
		$Rooms.get_child(1).position += Vector2(0, 50)
	
	#var room1 = 
	print($Rooms.get_children())
	#.position += Vector2(10, 10)
	
	#$Rooms.add_child()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
