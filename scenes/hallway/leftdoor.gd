# This script must be attached to an Area2D node.
extends Area2D

# 1. Export variable: Set your next scene path here in the Inspector.
@export_file("*.tscn") var next_scene_path: String = ""

# The function connected to the 'input_event' signal.
# 'event' is the only parameter needed for the click check.
func _on_left_door_clickable_input_event(_viewport: Node, event: InputEvent, _shape_idx: int):
	
	# Check if the 'click' action (Left Mouse Button) was pressed.
	if event.is_action_pressed("click"):
		
		# *** DEBUG CHECK (Will print in the Output panel) ***
		print("CLICK SUCCESSFUL! Attempting to switch scene...")
		
		# Stop the event from propagating to nodes underneath.
		get_viewport().set_input_as_handled() 
		
		# Change the scene.
		if next_scene_path != "":
			get_tree().change_scene_to_file(next_scene_path)
		else:
			print("ERROR: Next scene path is not set for this door.")
