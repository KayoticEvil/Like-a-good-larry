extends MarginContainer

@onready var label = $MarginContainer/Label
@onready var timer = $LetterDisplayTimer

const MAX_WIDTH = 480

var text: String = ""
var letterIndex := 0

var letterTime := 0.03
var spaceTime := 0.06
var punctuationTime := 0.2

signal finished_displaying

func display_text(text_to_display: String):
	text = text_to_display
	letterIndex = 0
	label.text = text_to_display
	
	await resized  # Wait for layout calculation
	custom_minimum_size.x = min(size.x, MAX_WIDTH)
	
	if size.x > MAX_WIDTH:
		label.autowrap_mode = TextServer.AUTOWRAP_WORD
		await resized
		await resized
		custom_minimum_size.y = size.y

	global_position.x -= size.x / 2
	global_position.y -= size.y + 24

	# Now display one letter at a time
	label.text = ""
	display_letter()

func display_letter():
	if letterIndex >= text.length():
		finished_displaying.emit()
		return

	label.text += text[letterIndex]
	
	var delay = letterTime
	match text[letterIndex]:
		"!", ".", "?", ",":
			delay = punctuationTime
		" ":
			delay = spaceTime
	
	letterIndex += 1
	timer.start(delay)

func _on_letter_display_timer_timeout() -> void:
	display_letter()
