extends Area2D

@onready var animations = $AnimationPlayer
@onready var textBox = $textBox

const lines: Array[String] = ["Go to Sleep?"]

func _ready() -> void:
	animations.play("noGlow")
	body_entered.connect(on_body_entered)
	body_exited.connect(on_body_exited)

func on_body_entered(body: Node) -> void:
	if body is CharacterBody2D:
		animations.play("glow")
		DialogueManager.startDialogue(global_position,lines)

func on_body_exited(body: Node) -> void:
	if body is CharacterBody2D:
		animations.play("noGlow")
