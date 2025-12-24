extends Area2D

@onready var animations = $AnimationPlayer

func _ready() -> void:
	animations.play("noGlow")
	body_entered.connect(on_body_entered)
	body_exited.connect(on_body_exited)

func on_body_entered(body: Node) -> void:
	if body is CharacterBody2D:
		animations.play("glow")

func on_body_exited(body: Node) -> void:
	if body is CharacterBody2D:
		animations.play("noGlow")
