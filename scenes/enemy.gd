extends Node2D

@export var movex : float = 0 
@export var movey : float = 0

func _process(delta):
	position.x += movex
	position.y += movey
