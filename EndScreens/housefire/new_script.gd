extends Control

func _ready():
	$HBoxContainer/VBoxContainer/Retry.connect("pressed", Callable(self, "_on_retry_pressed"))
	$HBoxContainer/VBoxContainer/Menu.connect("pressed", Callable(self, "_on_menu_pressed"))
	$HBoxContainer/VBoxContainer/Quit.connect("pressed", Callable(self, "_on_quit_pressed"))

func _on_retry_pressed():
	get_tree().change_scene_to_file("res://scenes/World.tscn")

func _on_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/MainMenu.tscn")

func _on_quit_pressed():
	get_tree().quit()
