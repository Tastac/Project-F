extends Area2D

func _on_body_entered(body: CharacterBody2D) -> void:
<<<<<<< Updated upstream
	print("You Died!")
=======
	print("You have Died")
>>>>>>> Stashed changes
	get_tree().reload_current_scene()
