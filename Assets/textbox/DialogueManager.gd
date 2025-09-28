extends Node

@onready var text_box_scene = preload("res://Assets/textbox/textbox.tscn")

var scriptLines: Array[String] = []
var lineIndex = 0;

var text_box
var text_box_position: Vector2

var activeDialogue = false
var advanceLine = false

func startDialogue(position: Vector2, lines: Array[String]):
	if activeDialogue:
		return
		
	scriptLines = lines
	text_box_position = position
	showTextBox()
	
	activeDialogue = true
	
func showTextBox():
	text_box = text_box_scene.instantiate()
	text_box.finished_displaying.connect(_on_text_box_finished)
	get_tree().root.add_child(text_box)
	text_box.global_position = text_box_position
	text_box.display_text(scriptLines[lineIndex])
	advanceLine = false
	
func _on_text_box_finished():
	advanceLine = true
	
func _unhandled_nput(event):
	if(event.is_action_pressed("advance_dialogue") && activeDialogue && advanceLine):
		text_box.queue_free()
		
		lineIndex += 1
		if lineIndex >= scriptLines.size:
			activeDialogue = false
			lineIndex = 0
			return
		showTextBox()
	
