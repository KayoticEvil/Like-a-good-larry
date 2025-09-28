extends Control

func _on_enter_pressed() -> void:
	var game_scene_path = "res://Game.tscn"
	get_tree().change_scene_to_file(game_scene_path)
	

func _on_exit_pressed() -> void:
	get_tree().quit()
