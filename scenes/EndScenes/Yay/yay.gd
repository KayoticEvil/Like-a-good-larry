extends Control

# Path to your main menu scene
const MAIN_MENU_SCENE := "res://Main_Menu.tscn"

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		_go_to_main_menu()
	elif event is InputEventKey and event.pressed and event.scancode == KEY_SPACE:
		_go_to_main_menu()

func _go_to_main_menu() -> void:
	get_tree().change_scene_to_file(MAIN_MENU_SCENE)
