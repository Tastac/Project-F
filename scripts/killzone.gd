extends Area2D

@onready var timer: Timer = $Timer

func _on_body_entered(body: CharacterBody2D) -> void:
	print("You have Died")
	get_tree().reload_current_scene()
